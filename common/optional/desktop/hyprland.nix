{ pkgs, inputs, marble, ... }: {
  programs.hyprlock.enable = true;
  # services.hypridle.enable = true;
  # programs.uwsm = {
  #     enable = true;
  #     waylandCompositors = {
  #     prettyName = "Hyprland";
  #     comment = "Hyprland compositor managed by UWSM";
  #     # binPath = "/run/current-system/sw/bin/Hyprland";
  #   };
  # };
  environment.systemPackages = with pkgs; [

    kitty
    wofi
    xdg-desktop-portal-hyprland
    fira-code-symbols
    waybar
  ];
  programs.uwsm.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  programs.hyprland = {
    enable = true;
    # set the flake package
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    systemd.setPath.enable = true;
    withUWSM = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

}
