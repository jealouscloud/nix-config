{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = (with pkgs; [
    rofi
    playerctl
    firefox
    pavucontrol
    devbox
  ]) ++
  (with pkgs-unstable; [
    # alacritty
  ]);
}