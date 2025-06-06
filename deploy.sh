#!/bin/sh
hostname=$(hostname)
user=$(whoami)

if [[ $1 == "system" ]] || [[ -z "$1" ]]; then
    sudo nixos-rebuild switch --flake .#${hostname}
elif [[ $1 == "home" ]]; then
    home-manager switch --flake .#${user}@${hostname}
else
    echo "Invalid argument: $1"
fi
