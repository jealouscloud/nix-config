{

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # environment.sessionVariables = {
  # QT_QPA_PLATFORM = "wayland";
  # NIXOS_OZONE_WL = "1";
  # };
  # services.desktopManager.plasma6.enableQt5Integration = true;
  # i18n.inputMethod.fcitx5.plasma6Support = true;
  services.xserver.xkb = {
    variant = "";
    layout = "us";
  };
}
