{
  description = "Your new nix config";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    hardware.url = "github:nixos/nixos-hardware";


    nix-alien.url = "github:thiagokokada/nix-alien";


    fabric-shell = {
      url = "github:Fabric-Development/fabric";  # or wherever it's hosted
      flake = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.url = "github:hyprwm/Hyprland";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = "${system}";
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "electron-27.3.11" ];
        };
      };

      pkgs-unstable = import nixpkgs-unstable {
        system = "${system}";
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "electron-27.3.11" ];
        };
      };
    in {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'

      nixosConfigurations = {
        nixos-vm = nixpkgs.lib.nixosSystem {
          # > Our main nixos configuration file <
          modules = [ ./hosts/nixos-vm/config.nix ];
          specialArgs = { inherit inputs outputs; };
        };
        leapfrog = nixpkgs.lib.nixosSystem {
          # > Our main nixos configuration file <
          modules = [ ./hosts/leapfrog/config.nix ];
          specialArgs = { inherit inputs outputs; };
        };
        work = nixpkgs.lib.nixosSystem {
          # > Our main nixos configuration file <
          modules = [ ./hosts/work/config.nix ];
          specialArgs = { inherit inputs outputs; };
        };

      };

      #   # Standalone home-manager configuration entrypoint
      #   # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        # FIXME replace with your username@hostname
        "noah@nixos-vm" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            inherit outputs;
            inherit pkgs-unstable;
            inherit system;
          };
          # > Our main home-manager configuration file <
          modules = [ ./hosts/nixos-vm/home.nix ];
        };
        "noah@leapfrog" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            inherit outputs;
            inherit pkgs-unstable;
            inherit system;
          };
          # > Our main home-manager configuration file <
          modules = [ ./hosts/leapfrog/home.nix ];
        };
        "noah@work" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
            inherit outputs;
            inherit pkgs-unstable;
            inherit system;
          };
          # > Our main home-manager configuration file <
          modules = [ ./hosts/work/home.nix ];
        };

      };
    };
}
