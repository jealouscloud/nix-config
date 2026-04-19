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
    rofi
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
      signing = {
        key = "0x7A2465CEBF62B908";
        signByDefault = true;
      };

      settings = {
        user = {
          name = "noaha";
          email = "noaha@inmotionhosting.com";   
        };
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
        theme = "~/.local/share/rofi/dracula/config1.rasi";
    };
  };
    home.file = {
      libykcs = {
        source = "${pkgs.yubico-piv-tool}/lib/libykcs11.so";
        target = ".ssh/libykcs11.so";
        executable = true;
      };
    };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.11";
}
