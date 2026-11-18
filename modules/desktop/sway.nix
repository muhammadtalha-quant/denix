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
        config.startup = [
          {
            command = "${pkgs.noctalia}/bin/noctalia";
            always = false;
          }
          {
            command = "systemctl --user restart xdg-desktop-portal.service";
            always = true;
          }
        ];
        extraConfig = lib.concatMapStringsSep "\n" lib.readFile [
          ./_dotfiles/sway/binds.conf
          ./_dotfiles/sway/gestures.conf
          ./_dotfiles/sway/layouts.conf
          ./_dotfiles/sway/looknfeel.conf
          ./_dotfiles/sway/rules.conf
        ];
      };
    };
  };
}
