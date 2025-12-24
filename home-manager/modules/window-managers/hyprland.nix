{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = ",preferred,auto,1";

      input = {
        kb_layout = "us";
      };

      animations = {
        enabled = false;
      };

      exec-once = [
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      windowrule = [
      ];

      bind = [
        "SUPER, Return, exec, ghostty"
        "SUPER, Q, killactive"
        "SUPER, M, exit"
        "SUPER, W, exec, firefox"
        "SUPER, S, exec, spotify"
        ##########################
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        ##########################
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"
        ##########################
        "SUPER, Space, exec, wofi --show drun"
        "SUPER, J, exec, signal-desktop --password-store=\"gnome-libsecret\""
        ##########################
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        ##########################
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        ##########################
        "SUPER, F, fullscreen"
        "SUPER, V, togglefloating"
        ##########################
        ", Print, exec, flameshot gui"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER SHIFT, mouse:272, resizewindow"
      ];
    };
  };
}
