# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, lib
, config
, pkgs
, ...
}:
{

  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ../../home-manager/common.nix
  ];

  home = {
    username = "noah";
    homeDirectory = "/home/noah";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];
  home.packages = 
    (with pkgs; [
      swappy
    ]);
  # Enable home-manager and git
  programs = {
    git = {
      enable = true;
      userName = "jealouscloud";
      userEmail = "github@noaha.org";
    };

    rbw = {
      settings = {
        email = "mail@noaha.org";
      };
    };
  };
}
