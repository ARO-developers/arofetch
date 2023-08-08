#!/bin/bash

installation_path=""

if [ "$1" = "install" ]; then
    echo "install"
elif [ "$1" = "update" ]; then
    echo "update"
fi

if echo "$PATH" | grep -q "$HOME/.local/bin" && echo "$PATH" | grep -q "/usr/local/bin"; then
    echo "you have both .local/bin and /usr/local/bin in path, which path do you choose for arofetch installation?"
    echo "1 ($HOME/.local/bin)"
    echo "2 (/usr/local/bin)"
    read -p "(1/2): " choice

    if [ "$1" = "install" ]; then
        echo "install"
    elif [ "$1" = "update" ]; then
        echo "update"
    fi

    if [ "$choice" = "1" ]; then
        installation_path="$HOME/.local/bin"
    else
        installation_path="/usr/local/bin"
    fi

    echo "Installing to $installation_path"

    #copy arofetch file
    cp "arofetch" "$installation_path"
    
    #give execution privileges to script
    chmod a+x "${installation_path}/arofetch"

    echo "installed"

elif echo "$PATH" | grep -q "$HOME/.local/bin"; then
    echo ".local/bin in PATH, going to copy arofetch there..."

    if [ "$1" = "install" ]; then
        echo "install"
    elif [ "$1" = "update" ]; then
        echo "update"
    fi


elif echo "$PATH" | grep -q "/usr/local/bin"; then
    echo "/usr/local/bin in PATH, going to copy arofetch there..."

    if [ "$1" = "install" ]; then
        echo "install"
    elif [ "$1" = "update" ]; then
        echo "update"
    fi
else
    echo "you dont have $HOME/.local/bin or /usr/local/bin in PATH, aborting installation!"
    return
fi