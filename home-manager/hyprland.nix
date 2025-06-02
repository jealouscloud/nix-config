{ pkgs, inputs, ... }: {

  wayland.windowManager.hyprland.enable = true; # enable Hyprland
  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
    # https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h
    bind = [
      "$mod, W, exec, firefox"
      "$mod, Return, exec, konsole"
      ", Print, exec, flameshot gui"
      "$mod, P, exec, rofi -modi window,run,drun -sidebar-mode -show drun"
      # "$mod, ;, exec, rofi-rbw -t password -a type"
    ] ++ (
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mod, code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ]) 9));
    exec-once =
      [ "copyq &" "systemctl start --user plasma-polkit-agent.service" ];
    monitor = [
      "eDP-1, 2880x1920@60, 0x0, 1"
      # or use auto-detection with custom scale:
      ",preferred,auto,1"
    ];
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
    };
  };

  services.swaync.enable = true;

# Then in your configuration
home.packages = [
  inputs.fabric-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
  inputs.fabric-shell.packages.${pkgs.stdenv.hostPlatform.system}.run-widget
];
  
}
