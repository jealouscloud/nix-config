{ 
pkgs
, ...
}: {
    programs.rofi = {
        enable = true;
    };
    home.file.".local/share/rofi" = {
        recursive = true;
        source = ./files/rofi;
    };
}