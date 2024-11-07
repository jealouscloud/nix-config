Based on https://github.com/Misterio77/nix-starter-configs/tree/main

## Bootstrap
```
curl -o bootstrap.sh https://raw.githubusercontent.com/jealouscloud/nix-config/refs/heads/main/bootstrap.sh
bash bootstrap.sh # optional args: hostname user
```


```
export NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#home-manager nixpkgs#git nixpkgs#vim

git clone git@github.com:jealouscloud/nix-config.git
cd nix-config

# Adjust for your host
cp /etc/nixos/hardware-configuration.nix ./hosts/nixos-vm/hardware-configuration.nix

sudo nixos-rebuild switch --flake .#your-hostname
home-manager switch --flake .#your-user@your-hostname
```

SSH keys: Make sure git has your local key as a deploy key.

## Maintenance
* Update with `nix flake update`
## Notes
* References: https://github.com/Misterio77/nix-config/tree/main/hosts/common/optional
    * https://github.com/Misterio77/nix-config/blob/main/flake.nix 
* Rebuild:

    * System: 
    Run `sudo nixos-rebuild switch --flake .#hostname` (replace 'hostname') to apply your system configuration.

    `.` in the command is the path

    * Home:
      * Run home-manager switch --flake .#username@hostname to apply your home configuration.
      * If you don't have home-manager installed, try `nix shell nixpkgs#home-manager`.

## Todo
* xfce keybinds