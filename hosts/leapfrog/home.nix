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
    ../../home-manager/kde.nix
    ../../home-manager/fabric-shell.nix
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
      rofi-wayland
      rofi-rbw-wayland
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
