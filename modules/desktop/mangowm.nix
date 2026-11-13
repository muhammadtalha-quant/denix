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
    homeManager = { pkgs, ... }: {
      imports = [
        inputs.mangowm.hmModules.mango
      ];
      wayland.windowManager.mango = {
        enable = true;
        package = pkgs.mango;
        systemd.enable = true; # create a mango-session.target and link it to graphical-session.target

      };
    };
  };
}
