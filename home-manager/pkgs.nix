{ pkgs, pkgs-unstable, ... }: {
  home.packages = (with pkgs; [
    playerctl
    firefox
    pavucontrol
    devbox
    copyq
    nixfmt-classic # nix code formatter
    nil # nix language server
    autokey
    pcmanfm
    arandr
    spotify
  ]) ++ (with pkgs-unstable;
    [
    logseq
      # alacritty
    ]);
}
