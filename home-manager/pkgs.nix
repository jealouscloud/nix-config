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
    copyq
  ]) ++
  (with pkgs-unstable; [
    # alacritty
  ]);
}