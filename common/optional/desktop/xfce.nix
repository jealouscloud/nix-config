{ pkgs, ... }:
{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  environment.systemPackages = with pkgs; [
    xfce.xfce4-volumed-pulse
    xfce.xfce4-pulseaudio-plugin
  ];
  programs = {
    gpg = {
      enable = true;
    }
    gpg-agent = {
      enable = true;
    }
  }
}
