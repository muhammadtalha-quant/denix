{
  desktop.hyprland = {
    nixos.programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = false;
    };
    homeManager.wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      extraLuaFiles = {
        "hyprland.events" = {
          content = ./_dotfiles/hypr/events.lua;
          autoLoad = true;
        };
        "hyprland.config" = {
          content = ./_dotfiles/hypr/config.lua;
          autoLoad = true;
        };
        "hyprland.rules" = {
          content = ./_dotfiles/hypr/rules.lua;
          autoLoad = true;
        };
        "hyprland.curves" = {
          content = ./_dotfiles/hypr/curves.lua;
          autoLoad = true;
        };
        "hyprland.animations" = {
          content = ./_dotfiles/hypr/animations.lua;
          autoLoad = true;
        };
        "hyprland.monitors" = {
          content = ./_dotfiles/hypr/monitors.lua;
          autoLoad = true;
        };
        "hyprland.gestures" = {
          content = ./_dotfiles/hypr/gestures.lua;
          autoLoad = true;
        };
        "lib.keys" = {
          content = ./_dotfiles/hypr/keys.lua;
          autoLoad = false;
        };
        "lib.helpers" = {
          content = ./_dotfiles/hypr/helpers.lua;
          autoLoad = false;
        };
        "hyprland.keybindings" = {
          content = ''
            require("hyprland.hotkeys.applications")
            require("hyprland.hotkeys.noctalia")
            require("hyprland.hotkeys.windows")
            require("hyprland.hotkeys.workspaces")
            require("hyprland.hotkeys.submaps")
          '';
          autoLoad = true;
        };
        "hyprland.hotkeys.applications" = {
          content = ./_dotfiles/hypr/applications.lua;
          autoLoad = false;
        };
        "hyprland.hotkeys.noctalia" = {
          content = ./_dotfiles/hypr/noctalia.lua;
          autoLoad = false;
        };
        "hyprland.hotkeys.windows" = {
          content = ./_dotfiles/hypr/windows.lua;
          autoLoad = false;
        };
        "hyprland.hotkeys.workspaces" = {
          content = ./_dotfiles/hypr/workspaces.lua;
          autoLoad = false;
        };
        "hyprland.hotkeys.submaps" = {
          content = ./_dotfiles/hypr/submaps.lua;
          autoLoad = false;
        };
      };
      extraConfig = ''
        require("noctalia")
      '';
    };
  };
}
