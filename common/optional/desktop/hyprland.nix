{pkgs, inputs, ... }: {
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
  ];
  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };
}
