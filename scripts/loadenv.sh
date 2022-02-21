#!/bin/sh

Help() {
    echo "Usage source loadenv.sh (*options*)"
    echo "-p | --path : Path to the .env file."
    echo "-h | --help : Display this message."
}

ENV_FILE=".env"

if [ $# -ne 0 ]; then
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
         Help
         return 0;
    fi

    if [ "$1" = "-p" ] || [ "$1" = "--path" ]; then
        shift;
    fi

    ENV_FILE="$1"
fi

if [ ! -f "$ENV_FILE" ]; then
    printf '%s\n' "No $ENV_FILE file in the working directory.";
    return 1;
fi

while read -r line; do
    export "$line";
done < "$ENV_FILE"

return 0;
