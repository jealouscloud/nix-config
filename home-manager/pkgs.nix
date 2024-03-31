{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = (with pkgs; [
    rofi
    playerctl
  ]) ++
  (with pkgs-unstable; [
    # alacritty
  ]);
}