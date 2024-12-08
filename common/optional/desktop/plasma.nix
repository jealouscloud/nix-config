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
  # NOTE:
  # MY DISPLAYS DO A DUMB THING, 2k @ 120hz x 2 WHICH DOES NOT WORK
  # LOG IN UN DOCKED, SET SETTINGS, THEN COPY TO SDDM
  # sudo cp ~/.config/kwinoutputconfig.json /var/lib/sddm/.config/
  # chown sddm:sddm /var/lib/sddm/.config/kwinoutputconfig.json
}
