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
          desktop-notifications = {
            command = "notify-send --wait --app-name \${app-id} --icon \${app-id} --category \${category} --urgency \${urgency} --expire-time \${expire-time} --hint STRING:image-path:\${icon} --hint BOOLEAN:suppress-sound:\${muted} --hint STRING:sound-name:\${sound-name} --replace-id \${replace-id} \${action-argument} --print-id -- \${title} \${body}";
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
