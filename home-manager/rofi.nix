{ 
pkgs
, ...
}: {
    # Some references:
    # https://github.com/nix-community/home-manager/blob/master/modules/programs/rofi.nix
    # https://github.com/nmasur/dotfiles/blob/master/modules/nixos/graphical/rofi.nix
    # https://github.com/JRMurr/NixOsConfig/blob/main/common/homemanager/rofi.nix
    # https://github.com/nmasur/dotfiles/blob/master/modules/nixos/graphical/rofi.nix

    home.file.".local/share/rofi" = {
        recursive = true;
        source = ./files/rofi;
    };
    # services.gpg-agent.pinentryPackage = pkgs.pinentry-rofi;
}