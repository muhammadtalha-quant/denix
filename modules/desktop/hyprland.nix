{
  desktop.hyprland = {
    nixos.programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
    homeManager.wayland.windowManager.hyprland = {
      enable = true;
      extraLuaFiles = {
        "hyprland.events" = {
          content = ./_dotfiles/hyprland/events.lua;
          autoLoad = true;
        };
        "hyprland.config" = {
          content = ./_dotfiles/hyprland/config.lua;
          autoLoad = true;
        };
        "hyprland.rules" = {
          content = ./_dotfiles/hyprland/rules.lua;
          autoLoad = true;
        };
        "hyprland.curves" = {
          content = ./_dotfiles/hyprland/curves.lua;
          autoLoad = true;
        };
        "hyprland.animations" = {
          content = ./_dotfiles/hyprland/animations.lua;
          autoLoad = true;
        };
        "hyprland.monitors" = {
          content = ./_dotfiles/hyprland/monitors.lua;
          autoLoad = true;
        };
        "hyprland.gestures" = {
          content = ./_dotfiles/hyprland/gestures.lua;
          autoLoad = true;
        };
        "lib.keys" = {
          content = ./_dotfiles/hyprland/lib/keys.lua;
          autoLoad = false;
        };
        "lib.helpers" = {
          content = ./_dotfiles/hyprland/lib/helpers.lua;
          autoLoad = false;
        };
        "hyprland.__keybinds__" = {
          content = ./_dotfiles/hyprland/__keybinds__.lua;
          autoLoad = true;
        };
        "hyprland.keybinds.applications" = {
          content = ./_dotfiles/hyprland/keybinds/applications.lua;
          autoLoad = false;
        };
        "hyprland.keybinds.noctalia_shell" = {
          content = ./_dotfiles/hyprland/keybinds/noctalia_shell.lua;
          autoLoad = false;
        };
        "hyprland.keybinds.windows" = {
          content = ./_dotfiles/hyprland/keybinds/windows.lua;
          autoLoad = false;
        };
        "hyprland.keybinds.workspaces" = {
          content = ./_dotfiles/hyprland/keybinds/workspaces.lua;
          autoLoad = false;
        };
          autoLoad = false;
        };
      };
    };
  };
}
