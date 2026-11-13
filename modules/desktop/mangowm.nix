{ inputs, ... }: {
  desktop.mangowm = {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.mangowm.nixosModules.mango
      ];
      programs.mango = {
        enable = true;
        package = pkgs.mango;
      };
    };
    homeManager = { lib, pkgs, ... }: {
      imports = [
        inputs.mangowm.hmModules.mango
      ];
      wayland.windowManager.mango = {
        enable = true;
        package = pkgs.mango;
        systemd.enable = true;
        systemd.extraCommands = [
          "systemctl --user reset-failed"
          "systemctl --user start mango-session.target"
          "systemctl --user start xdg-desktop-portal.service"
        ];
        autostart_sh = ''
          ${pkgs.noctalia}/bin/noctalia &
        '';
        extraConfig = lib.concatMapStringsSep "\n" lib.readFile [
          ./_dotfiles/mango/binds.conf
          ./_dotfiles/mango/config.conf
          ./_dotfiles/mango/gestures.conf
          ./_dotfiles/mango/layouts.conf
          ./_dotfiles/mango/looknfeel.conf
          ./_dotfiles/mango/monitors.conf
          ./_dotfiles/mango/rules.conf
        ];
      };
    };
  };
}
