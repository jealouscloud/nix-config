{ pkgs, ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    variant = "";
    layout = "us";
  };

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xterm
    ];
    displayManager = {
      lightdm = {
        enable = true;
        greeters.gtk = {
          enable = true;
        };
      };
    };
    desktopManager = {
      xfce = {
        enable = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xfce.xfce4-volumed-pulse
    xfce.xfce4-pulseaudio-plugin
    xfce.catfish
    xfce.gigolo
    xfce.orage
    xfce.xfburn
    xfce.xfce4-appfinder
    xfce.xfce4-clipman-plugin
    xfce.xfce4-cpugraph-plugin
    xfce.xfce4-dict
    xfce.xfce4-fsguard-plugin
    xfce.xfce4-genmon-plugin
    xfce.xfce4-netload-plugin
    xfce.xfce4-panel
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-systemload-plugin
    xfce.xfce4-weather-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-xkb-plugin
    xfce.xfdashboard
  ];
}
