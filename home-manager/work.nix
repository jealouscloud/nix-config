# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, pkgs-unstable, ... }: {

  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./common.nix
  ];

  home.packages = (with pkgs; [ openvpn  ]) ++ (with pkgs-unstable;
    [
        slack
        telegram-desktop
    ]);

  home = {
    username = "noah";
    homeDirectory = "/home/noah";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  programs = {
    git = {
      enable = true;
      userName = "noaha";
      userEmail = "noaha@inmotionhosting.com";
    };
  };
}