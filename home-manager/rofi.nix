{ 
pkgs
, ...
}: {
    # Some references:
    # https://github.com/nix-community/home-manager/blob/master/modules/programs/rofi.nix
    # https://github.com/nmasur/dotfiles/blob/master/modules/nixos/graphical/rofi.nix
    programs.rofi = {
        enable = true;
        theme = "~/.local/share/rofi/dracula/config1.rasi";
    };
    home.file.".local/share/rofi" = {
        recursive = true;
        source = ./files/rofi;
    };
    services.gpg-agent.pinentryPackage = pkgs.pinentry-rofi;
}