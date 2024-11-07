export NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#home-manager nixpkgs#git nixpkgs#vim

git clone https://github.com/jealouscloud/nix-config.git
cd nix-config

setup-user () {

    user=$(whoami)
    
    if [[ -n "$1" ]]; then
        hostname=$1
    fi

    if [[ -n "$2" ]]; then
        user=$2
    fi
set -x
    sudo nixos-rebuild switch --flake .#${hostname}
    home-manager switch --flake .#${user}@${hostname}
set +x

};

# Example usage: bootstrap.sh setup-user myhostname myuser
setup-user $1 $2