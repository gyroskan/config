#!/bin/sh

all_yes="$1"
echo "$all_yes"

function ask() {
    if [ "$all_yes" = "-y" ]; then
        return 0;
    fi

    echo "$*" "[y/n]"
    read -n1 asked
    echo

    if [ "$asked" = 'y' ] || [ "$asked" = 'Y' ]; then
        return 0;
    else
        return 1;
    fi
}

function dl_plugin() {
    echo "Downloading $2..."
    if git clone -q "https://github.com/$1" "${ZSH_CUSTOM:$HOME/.oh-my-zsh/custom}/plugins/$2"; then
        echo "Done."
    else
        echo "Failed."
    fi
}

if ask 'Do you want to download oh-my-zsh plugins?'; then
    # Download all the plugins from their github repos
    dl_plugin 'agkozak/zsh-z' 'zsh-z'
    dl_plugin 'zsh-users/zsh-autosuggestions' 'zsh-autosuggestions'
    dl_plugin 'zsh-users/zsh-syntax-highlighting' 'zsh-syntax-highlighting'
    dl_plugin 'MichaelAquilina/zsh-you-should-use' 'you-should-use'
    dl_plugin 'chisui/zsh-nix-shell' 'nix-shell'
    dl_plugin 'popstas/zsh-command-time' 'command-time'
fi

if ask 'Do you want to create all symlinks?'; then
    echo Okay
fi
