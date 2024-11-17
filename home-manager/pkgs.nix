{ pkgs, pkgs-unstable, ... }: {
  home.packages = (with pkgs; [
    playerctl
    firefox
    thunderbird
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
    wezterm
    cifs-utils # for cifs mounts/samba
    xdg-desktop-portal-gtk # flatpak

    rye # python dev tool
    bc # cli calculator
    python3

    lazygit # fun cli for git, remove if you don't use

    # fonts
    monaspace

    # messenger apps
    telegram-desktop

  ]) ++ (with pkgs-unstable;
    [
    logseq
      # alacritty
    ]);
}
