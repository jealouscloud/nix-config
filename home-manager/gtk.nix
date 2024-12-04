
{ 
pkgs,
config
, ...
}: {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.dracula-icon-theme;
    name = "Dracula";
  };
  home.packages = (with pkgs; [
    dracula-theme
    dracula-icon-theme
  ]);

  gtk = {
    enable = true;
    theme = {
        name = "Dracula";
        package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
  };
}