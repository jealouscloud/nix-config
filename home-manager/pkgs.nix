{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = (with pkgs; [
    playerctl
    firefox
    pavucontrol
    devbox
  ]) ++
  (with pkgs-unstable; [
    # alacritty
  ]);
}