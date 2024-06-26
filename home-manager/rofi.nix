{ 
pkgs
, ...
}: {
    programs.rofi = {
        enable = true;
        theme = "~/.local/share/rofi/dracula/config1.rasi";
    };
    home.file.".local/share/rofi" = {
        recursive = true;
        source = ./files/rofi;
    };
}