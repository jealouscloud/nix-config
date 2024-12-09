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
  xdg.configFile."kglobalshortcutsrc".source = ./files/kde/kglobalshortcutsrc;
  # home.packages = (with pkgs; [
  #   # xfce.xfdashboard
  # ]);
}
