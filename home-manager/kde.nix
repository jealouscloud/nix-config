{ pkgs
, ...
}:
{
  xdg.configFile."kde.org/konsole.conf".text = ''
  [plugins]
  quickcommands\shortcut=Ctrl+Space
  '';
  xdg.dataFile."konsole" = {
    source = ./files/kde/konsole;
    recursive = true;
  };
  # xdg.configFile."kglobalshortcutsrc".source = ./files/kde/kglobalshortcutsrc;
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + w" = "firefox";
      "super + Return" = "konsole";
      "Print" = "flameshot gui";
      "super + p" = "rofi -modi window,run,drun -sidebar-mode -show drun";
      # "$mod, ;" = "rofi-rbw -t password -a type";
    };
  };
  # home.packages = (with pkgs; [
  #   # xfce.xfdashboard
  # ]);
}
