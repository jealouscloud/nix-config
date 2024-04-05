{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = (with pkgs; [
    rofi
    playerctl
    firefox
  ]) ++
  (with pkgs-unstable; [
    # alacritty
  ]);
}