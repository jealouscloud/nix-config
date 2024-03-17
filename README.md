Based on https://github.com/Misterio77/nix-starter-configs/tree/main


## Notes
* nix flake update to update lock file
* References: https://github.com/Misterio77/nix-config/tree/main/hosts/common/optional
    * https://github.com/Misterio77/nix-config/blob/main/flake.nix 
* Rebuild:

    * System: 
    Run `sudo nixos-rebuild switch --flake .#hostname` (replace 'hostname') to apply your system configuration.

    `.` in the command is the path

    * Home:
      * Run home-manager switch --flake .#username@hostname to apply your home configuration.
      * If you don't have home-manager installed, try `nix shell nixpkgs#home-manager`.

