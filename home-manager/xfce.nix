{ pkgs
, ...
}:
{
  xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml".source = ./files/xfce/xfce4-keyboard-shortcuts.xml;
  home.packages = (with pkgs; [
    xfce.xfdashboard
  ]);
}
