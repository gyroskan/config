#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 3
fi

Help () {
    echo "Usage sudo ./init_git_repo.sh userName repoPath"
    echo "-h | --help : display this message"
}

Error () {
    echo -e "\033[1;31mError: $1" >&2
    if [ $# -eq 2 ]; then
        exit "$2"
    fi
    exit 1;
}

CleanUp () {
    rm "$fullRepo" -r
    # TODO better cleanup of -p option from mkdir
}

if [ $# -ne 2 ]; then
    Help
    exit 2;
fi

user="$1"

repo="$2"
if [ "${repo::1}" = "/" ]; then 
    repo="${repo:1}"
fi
if [ "${repo: -4}" != ".git" ]; then
    repo="${repo}.git"
fi

fullRepo="/home/git/$user/$repo"

if [ -d "$fullRepo" ]; then
    Error "The repository $repo already exists" 9
fi

if [ ! -d "/home/git/$user" ]; then
    Error "User '$user' is not setup as a git user." 3
fi

if ! (mkdir -p "$fullRepo") ; then
    Error "Failed to create repository $repo" 5
fi

if ! ( cd "$fullRepo"  &&  git init --bare ); then
    Cleanup
    Error "Failed to init the git repository $repo" 5
fi

if ! (chown git:git -R "$fullRepo") || ! (chmod -R g-r,o-rx "$fullRepo"); then
    Cleanup
    Error "Failed to give proper permission to the git repository $repo" 5
fi

echo "Initiated '$repo' at '$fullRepo' for user '$user'!"
