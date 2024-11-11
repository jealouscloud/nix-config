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
    echo "Usage: $0 [partition /dev/drive | configure --hostname myhsotname --user myuser]..."
    echo "Options:"
    echo "  -h, --help             Display this help message"
    echo "  -n, --hostname NAME    Set the hostname"
    echo "  -u, --user USERNAME    Set the username (default: current user)"
}
parse_configure_args() {
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

}
parse_partition_args() {
    # Parse command line arguments
    drive="$1"
    swap=8GB
    shift
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                echo "options: --swap 8GB"
                exit 0
            ;;
            -s|--swap)
                swap="$2"
                shift 2
            ;;
            *)
                echo "Unknown option: $1"
                print_usage
                exit 1
            ;;
        esac
    done

    echo "Partitioning drive $drive..."
    set -xe
    parted $drive -- mklabel gpt
    parted $drive -- mkpart root ext4 512MB -8GB
    parted $drive -- mkpart swap linux-swap -8GB 100%
    parted $drive -- mkpart ESP fat32 1MB 512MB
    parted $drive -- set 3 esp on
    # try to detect sda/nvme
    if echo $drive | grep -E 'd[a-z]$'; then
        p1=${drive}1
        p2=${drive}2
        p3=${drive}3
    else
        p1=${drive}p1
        p2=${drive}p2
        p3=${drive}p3
    fi
    mkfs.ext4 -L nixos $p1
    mkswap -L swap $p2
    mkfs.fat -F 32 -n boot $p3

    mount /dev/disk/by-label/nixos /mnt
    mkdir -p /mnt/boot
    mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
    swapon $p2

    nixos-generate-config --root /mnt

    set +xe

}
# parse command, "partition", "configure"

while [[ $# -gt 0 ]]; do
    case $1 in
        partition)
            shift
        ;;
        configure)
            shift
            parse_configure_args "$@"
            setup-user "$hostname" "$user"
            exit 0
        ;;
        *)
            print_usage
            exit 1
    esac
done
