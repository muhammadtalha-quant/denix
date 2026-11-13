{
  desktop.xdg = {
    nixos = { pkgs, ... }: {
      xdg.portal.wlr = {
        enable = true;
        settings.screencast = {
          chooser_type = "dmenu";
          chooser_cmd = "${pkgs.noctalia}/bin/noctalia dmenu -p 'Share to Record'";
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
                "gtk"
              ];
            };
            mango = {
              default = [
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
