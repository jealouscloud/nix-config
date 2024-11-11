{
  description = "Your new nix config";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'

    nixosConfigurations = {
      # FIXME replace with your hostname
      developer = nixpkgs.lib.nixosSystem {
        # > Our main nixos configuration file <
        modules = [ ./hosts/nixos-vm ];
        specialArgs = {inherit inputs outputs;};
      };
      macbook = nixpkgs.lib.nixosSystem {
        # > Our main nixos configuration file <
        modules = [ ./hosts/macbook-vm ];
        specialArgs = {inherit inputs outputs;};
      };
      slider = nixpkgs.lib.nixosSystem {
        # > Our main nixos configuration file <
        modules = [ ./hosts/nixos-slider ];
        specialArgs = {inherit inputs outputs;};
      };
      leapfrog = nixpkgs.lib.nixosSystem {
        # > Our main nixos configuration file <
        modules = [ ./hosts/leapfrog ];
        specialArgs = { inherit inputs outputs; };
      };

 };

  #   # Standalone home-manager configuration entrypoint
  #   # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      # FIXME replace with your username@hostname
      "noah@developer" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit outputs;
          inherit pkgs-unstable;
        };
        # > Our main home-manager configuration file <
        modules = [./home-manager/home.nix];
      };
     "noah@macbook" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit outputs;
          inherit pkgs-unstable;
        };
        # > Our main home-manager configuration file <
        modules = [./home-manager/home.nix];
      };
      "noah@slider" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit outputs;
          inherit pkgs-unstable;
        };
        # > Our main home-manager configuration file <
        modules = [./home-manager/home.nix];
      };

    };
  };
}
