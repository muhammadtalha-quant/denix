{
  desktop.xdg.homeManager.xdg = { pkgs, ... }: {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
      config = {
        common = {
          default = [
            "hyprland"
            "gtk"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
          "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        };
      };
    };
    userDirs.enable = true;
    userDirs.createDirectories = true;
    localBinInPath = true;
  };
}
