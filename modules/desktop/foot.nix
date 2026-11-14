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
          systemdTarget = "mango-session.target";
        };
        settings = {
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
