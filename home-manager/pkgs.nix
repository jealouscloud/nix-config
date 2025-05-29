{ pkgs, pkgs-unstable, inputs, system, ... }: {
  home.packages = (with pkgs; [
    playerctl
    firefox
    thunderbird
    pavucontrol
    mission-center # task manager
    copyq
    autokey
    flameshot

    gitnuro # git client

    pcmanfm
    lxmenu-data # populate applications

    arandr

    pinentry-gtk2
    xdotool

    ptyxis
    terminator
    wezterm
    cifs-utils # for cifs mounts/samba
    xdg-desktop-portal-gtk # flatpak

    bc # cli calculator
    jq # parse json

    # fonts
    monaspace

    # messenger apps
    telegram-desktop

    textpieces # simple text editor space

    # system troubleshooting
    d-spy
    bustle
    thunderbolt # user space, tbtadm

    # keyboard

    keymapp # zsa / voyager layer display
    screenkey

    # fonts
    noto-fonts

  ]) ++ (with pkgs-unstable;
  
    [
      spotify
    # logseq
    # zed-editor
    ]) ++ (with inputs.nix-alien.packages.${system};
    [
      nix-alien
    ]);
}
