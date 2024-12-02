{pkgs, inputs, ... }: {
  programs.hyprlock.enable = true;
  programs.hyprland.enable = true;
  # services.hypridle.enable = true;
  programs.uwsm = {
      enable = true;
      waylandCompositors = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
}