
{ 
pkgs,
config
, ...
}: {

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