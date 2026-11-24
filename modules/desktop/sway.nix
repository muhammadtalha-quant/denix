{
  desktop.sway = {
    nixos = {
      programs.sway = {
        enable = true;
        xwayland.enable = true;
        extraPackages = [ ];
        wrapperFeatures = {
          base = true;
          gtk = true;
        };
      };
    };
    homeManager = { lib, pkgs, ... }: {
      wayland.windowManager.sway = {
        enable = true;
        xwayland = true;
        checkConfig = true;
        systemd = {
          enable = true;
          dbusImplementation = "dbus";
        };
        wrapperFeatures = {
          base = true;
          gtk = true;
        };
        config = {
          modifier = "Mod4";
          bars = [ ];

          window = {
            titlebar = false;
            border = 2;
            commands = [
              {
                criteria = { all = true; };
                command = "border pixel 2";
              }
              {
                criteria = { app_id = "xdg-desktop-portal-gtk"; };
                command = "floating enable, resize set 800 600";
              }
              {
                criteria = { title = ''^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$''; };
                command = "floating enable, resize set 25 ppt 25 ppt";
              }
              {
                criteria = { app_id = "dev.noctalia.Noctalia"; };
                command = "floating enable, resize set 1166 694";
              }
            ];
          };

          floating = {
            titlebar = false;
            border = 2;
            modifier = "Mod4 normal";
          };

          gaps = {
            inner = 5;
            outer = 10;
          };

          input = {
            "type:keyboard" = {
              xkb_options = "caps:escape,compose:ralt";
            };
          };

          modes = {
resize = {
  Left = "resize shrink width 10 px";
  Right = "resize grow width 10 px";
  Up = "resize shrink height 10 px";
  Down = "resize grow height 10 px";

  "Shift+Left" = "resize shrink width 50 px";
  "Shift+Right" = "resize grow width 50 px";
  "Shift+Up" = "resize shrink height 50 px";
  "Shift+Down" = "resize grow height 50 px";

  "Control+Left" = "resize shrink width 5 ppt";
  "Control+Right" = "resize grow width 5 ppt";
  "Control+Up" = "resize shrink height 5 ppt";
  "Control+Down" = "resize grow height 5 ppt";

  Return = ''mode "default"'';
  Escape = ''mode "default"'';
};


output = {
  # ── Focus Monitor ──
  Left = "focus output left";
  Right = "focus output right";
  Up = "focus output up";
  Down = "focus output down";

  # ── Move Window + Follow ──
  "Shift+Left" = "move container to output left; focus output left";
  "Shift+Right" = "move container to output right; focus output right";
  "Shift+Up" = "move container to output up; focus output up";
  "Shift+Down" = "move container to output down; focus output down";

  # ── Move Window Silently ──
  "Alt+Left" = "move container to output left";
  "Alt+Right" = "move container to output right";
  "Alt+Up" = "move container to output up";
  "Alt+Down" = "move container to output down";

  # ── Move Entire Workspace + Follow ──
  "Control+Left" = "move workspace to output left; focus output left";
  "Control+Right" = "move workspace to output right; focus output right";
  "Control+Up" = "move workspace to output up; focus output up";
  "Control+Down" = "move workspace to output down; focus output down";

  # ── Exit ──
  Return = ''mode "default"'';
  Escape = ''mode "default"'';
};

          };

          keybindings = lib.mkForce {
            # ── App Launchers ──
            "Mod4+Return" = "exec footclient";
            "Mod4+b" = "exec google-chrome";
            "Mod4+e" = "exec nautilus";
            "Mod4+c" = "exec codium";
            "Mod4+semicolon" = "exec localsend_app";
            "Mod4+n" = "exec obsidian";

            # ── Window Management ──
            "Mod4+q" = "kill";
            "Mod4+t" = "floating toggle, border pixel 2";
            "Mod4+p" = "sticky toggle";
            "Mod4+f" = "fullscreen toggle";

            # ── Focus (Arrow Keys) ──
            "Mod4+Left" = "focus left";
            "Mod4+Right" = "focus right";
            "Mod4+Up" = "focus up";
            "Mod4+Down" = "focus down";

            # ── Manual Tiling ──
            "Mod4+backslash" = "splith";
            "Mod4+apostrophe" = "splitv";
            "Mod4+w" = "layout toggle tabbed split";
            "Mod4+a" = "focus parent";
            "Mod4+z" = "focus child";

            # ── Resize Mode ──
            "Mod4+r" = ''mode "resize"'';

            # ── Workspaces: Switch ──
            "Mod4+1" = "workspace number 1";
            "Mod4+2" = "workspace number 2";
            "Mod4+3" = "workspace number 3";
            "Mod4+4" = "workspace number 4";
            "Mod4+5" = "workspace number 5";
            "Mod4+6" = "workspace number 6";
            "Mod4+7" = "workspace number 7";
            "Mod4+8" = "workspace number 8";
            "Mod4+9" = "workspace number 9";

            # ── Workspaces: Move + Follow ──
            "Mod4+Shift+1" = "move container to workspace number 1; workspace number 1";
            "Mod4+Shift+2" = "move container to workspace number 2; workspace number 2";
            "Mod4+Shift+3" = "move container to workspace number 3; workspace number 3";
            "Mod4+Shift+4" = "move container to workspace number 4; workspace number 4";
            "Mod4+Shift+5" = "move container to workspace number 5; workspace number 5";
            "Mod4+Shift+6" = "move container to workspace number 6; workspace number 6";
            "Mod4+Shift+7" = "move container to workspace number 7; workspace number 7";
            "Mod4+Shift+8" = "move container to workspace number 8; workspace number 8";
            "Mod4+Shift+9" = "move container to workspace number 9; workspace number 9";

            # ── Workspaces: Move Silent ──
            "Mod4+Alt+1" = "move container to workspace number 1";
            "Mod4+Alt+2" = "move container to workspace number 2";
            "Mod4+Alt+3" = "move container to workspace number 3";
            "Mod4+Alt+4" = "move container to workspace number 4";
            "Mod4+Alt+5" = "move container to workspace number 5";
            "Mod4+Alt+6" = "move container to workspace number 6";
            "Mod4+Alt+7" = "move container to workspace number 7";
            "Mod4+Alt+8" = "move container to workspace number 8";
            "Mod4+Alt+9" = "move container to workspace number 9";

            # ── Scratchpad ──
            "Mod4+s" = "scratchpad show";
            "Mod4+Shift+s" = "move scratchpad";

            # ── Window Switcher ──
            "Mod1+Tab" = "exec noctalia msg window-switcher";

            # ── Noctalia / Panels / Utilities ──
            "Mod4+space" = "exec noctalia msg panel-toggle launcher";
            "Mod4+period" = "exec noctalia msg settings-toggle";
            "Mod4+v" = "exec noctalia msg panel-toggle clipboard";
            "Mod4+comma" = "exec noctalia msg panel-toggle launcher /e";
            "--locked XF86AudioMute" = "exec noctalia msg volume-mute";
            "--locked XF86AudioPlay" = "exec noctalia msg media toggle";
            "Print" = "exec noctalia msg screenshot-region";
            "Shift+Print" = "exec noctalia msg screenshot-fullscreen";
            "Alt+Print" = "exec noctalia msg plugin noctalia/screen_recorder:service all toggle";
            "Control+Alt+Delete" = "exec noctalia msg panel-toggle session";
            "Mod4+l" = "exec noctalia msg session lock";

            # ── Media / Brightness (locked) ──
            "--locked XF86AudioRaiseVolume" = "exec noctalia msg volume-up";
            "--locked XF86AudioLowerVolume" = "exec noctalia msg volume-down";
            "--locked XF86MonBrightnessUp" = "exec noctalia msg brightness-up";
            "--locked XF86MonBrightnessDown" = "exec noctalia msg brightness-down";
          };

          startup = [
            {
              command = "${pkgs.noctalia}/bin/noctalia";
              always = false;
            }
            {
              command = "systemctl --user restart xdg-desktop-portal.service";
              always = true;
            }
            {
              command = "exec swaymsg workspace number 1";
              always = true;
            }
          ];
        };
        extraConfig = ''
          # ── 3-finger gestures ──
          bindgesture swipe:3:down exec noctalia msg session lock
          bindgesture swipe:3:up fullscreen toggle
          bindgesture swipe:3:left workspace prev
          bindgesture swipe:3:right workspace next

          # ── 4-finger gestures ──
          bindgesture hold:4 exec noctalia msg screenshot-region
          bindgesture swipe:4:down exec noctalia msg screenshot-fullscreen
          bindgesture swipe:4:up exec noctalia msg plugin noctalia/screen_recorder:service all toggle
        '';
      };
    };
  };
}
