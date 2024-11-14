{ pkgs, pkgs-unstable, ... }: {
  home.packages = (with pkgs; [
    playerctl
    firefox
    pavucontrol
    mission-center # task manager
    devbox
    copyq
    nixfmt-classic # nix code formatter
    nil # nix language server
    autokey
    pcmanfm
    arandr
    spotify

    # bitwarden via rofi
    pinentry-gtk2
    rofi-rbw
    xdotool

    ptyxis
    terminator
    cifs-utils # for cifs mounts/samba

    rye # python dev tool
    bc # cli calculator
    python3

    lazygit # fun cli for git, remove if you don't use

    # fonts
    monaspace

  ]) ++ (with pkgs-unstable;
    [
    logseq
      # alacritty
    ]);
}
