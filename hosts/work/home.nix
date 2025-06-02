# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, pkgs-unstable, ... }: {

  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ../../home-manager/common.nix
    ../../home-manager/kde.nix
  ];

  home.packages = (with pkgs; [ 
    openvpn
    rofi-wayland
    rofi-rbw-wayland
    dig
    ipcalc
    file
    lite-xl
    obs-studio
    vlc
    zeal
    ])
    ++ (with pkgs-unstable; [ 
      slack
      adoptopenjdk-icedtea-web 
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
      signing = {
        key = "0x7A2465CEBF62B908";
        signByDefault = true;
      };
    };

    rbw = {
      enable = true;
      settings = {
        email = "noaha@inmotionhosting.com";
        base_url = "https://vault0.imhadmin.net/";
        lock_timeout = 36000;
      };

      package = pkgs.rofi-rbw-wayland;
    };


    rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        theme = "~/.local/share/rofi/dracula/config1.rasi";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
