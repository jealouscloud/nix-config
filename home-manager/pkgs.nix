{ pkgs, pkgs-unstable, inputs, system, ... }: {
  home.packages = (with pkgs; [
    playerctl
    firefox
    thunderbird
    pavucontrol
    mission-center # task manager
    copyq
    nixfmt-classic # nix code formatter
    nixpkgs-fmt
    nil # nix language server
    nixd
    autokey

    devbox
    direnv

    pcmanfm
    lxmenu-data # populate applications

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
    uv # python pip replacement

    bc # cli calculator
    python3
    jq # parse json

    lazygit # fun cli for git, remove if you don't use

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

  ]) ++ (with pkgs-unstable;
  
    [
    logseq

    # ai tools
    aichat
    fabric-ai
    libedgetpu
    edgetpu-compiler
    argc # for llm-functions
      # alacritty
    zed-editor
    ]) ++ (with inputs.nix-alien.packages.${system};
    [
      nix-alien
    ]);
}
