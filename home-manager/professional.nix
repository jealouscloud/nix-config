{ pkgs, pkgs-unstable, ... }: {
  home.packages = (with pkgs; [
    openvpn
    slack
    telegram-desktop
  ]) ++ (with pkgs-unstable;
    [
      # alacritty
    ]);
}
