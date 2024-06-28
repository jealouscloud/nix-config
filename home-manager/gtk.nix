
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
        name = "dracula";
        package = pkgs.dracula-theme;
    };
  };
}