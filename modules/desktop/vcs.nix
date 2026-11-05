{
  desktop.vcs = { user }: {
    nixos = { pkgs, ... }: {
      programs = {
        gnupg.agent.pinentryPackage = pkgs.pinentry-gnome3;
        seahorse.enable = true;
      };
    };
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.gh ];
      programs = {
        lazygit.enable = true;
        git = {
          enable = true;
          signing = {
            key = user.publicGPGKey;
            format = "openpgp";
            signByDefault = true;
            signer = "${pkgs.gnupg}/bin/gpg2";
          };
          settings = {
            init = {
              defaultBranch = "main";
            };
            commit = {
              gpgSign = true;
            };
            tag = {
              gpgSign = true;
            };
            user = {
              name = user.realName;
              email = user.emailAddress;
              useConfigOnly = true;
            };
            credential = {
              "https://github.com" = {
                helper = "${pkgs.gh}/bin/gh auth git-credential";
              };
              "https://gist.github.com" = {
                helper = "${pkgs.gh}/bin/gh auth git-credential";
              };
            };
            http = {
              version = "HTTP/1.1";
              postBuffer = 524288000;
              lowSpeedLimit = 1000;
              lowSpeedTime = 600;
            };
          };
        };
      };
    };
  };
}
