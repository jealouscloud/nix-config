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
  ]) ++
  (with pkgs-unstable; [
    # alacritty
  ]);
}