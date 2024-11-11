#!/bin/bash
export NIX_CONFIG="experimental-features = nix-command flakes"
nix_shell="nix shell nixpkgs#home-manager nixpkgs#git nixpkgs#vim --command"
$nix_shell git clone https://github.com/jealouscloud/nix-config.git

cd nix-config

setup-user () {
    set -x
    $nix_shell nixos-rebuild switch --flake .#${hostname}
    if [[ -n "$user" ]]; then
        home-manager switch --flake .#${user}@${hostname}
    fi
    set +x
}

print_usage() {
    echo "Usage: $0 [OPTION]..."
    echo "Options:"
    echo "  -h, --help             Display this help message"
    echo "  -n, --hostname NAME    Set the hostname"
    echo "  -u, --user USERNAME    Set the username (default: current user)"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            print_usage
            exit 0
            ;;
        -n|--hostname)
            hostname="$2"
            shift 2
            ;;
        -u|--user)
            user="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            print_usage
            exit 1
            ;;
    esac
done

# Check if hostname is provided
if [[ -z "$hostname" ]]; then
    echo "Error: Hostname is required"
    print_usage
    exit 1
fi

# Run setup-user with parsed arguments
setup-user "$hostname" "$user"