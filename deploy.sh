#!bash

if [[ $1 == "system" ]] || [[ -z "$1" ]]; then
    sudo nixos-rebuild switch --flake .#$(hostname)
elif [[ $1 == "home" ]]; then
    home-manager switch --flake .#$(whoami)@$(hostname)
elses
    echo "Invalid argument: $1"
fi
