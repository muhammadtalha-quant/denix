{
  desktop.xdg = {
    nixos = { lib, pkgs, ... }: {
      xdg.portal.wlr = {
        enable = true;
        settings = {
          chooser_style = "dmenu";
          chooser_cmd = "${lib.getExe pkgs.noctalia} dmenu";
        };
      };
    };
    homeManager = { pkgs, ... }: {
      xdg = {
        portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-wlr
          ];
          config = {
            common = {
              default = [
                "wlr"
                "gtk"
              ];
              "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
              "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
              "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
            };
          };
        };
        userDirs.enable = true;
        userDirs.createDirectories = true;
        localBinInPath = true;
      };
    };
  };
}
