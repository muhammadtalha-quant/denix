{
  desktop.foot = {
    nixos.programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "footclient";
    };
    homeManager.programs = {
      foot = {
        enable = true;
        server = {
          enable = true;
          systemdTarget = "hyprland-session.target";
        };
        settings = {
          bell = {
            system = "no";
          };
          cursor = {
            style = "beam";
            blink = "yes";
          };
          scrollback = {
            lines = 100000;
          };

          csd = {
            preferred = "none";
          };

          main = {
            font-size-adjustment = 2.0;
          };
        };
      };
    };
  };
}
