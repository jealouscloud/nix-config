{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    variant = "";
    layout = "us";
  };

}
