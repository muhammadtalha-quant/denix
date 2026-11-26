{
  desktop.environment = {
    nixos.environment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "code";
      GTK_IM_MODULE = "simple";
      QT_QPA_PLATFORM = "wayland";
      GDK_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      NIXOS_OZONE_WL = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };
}
