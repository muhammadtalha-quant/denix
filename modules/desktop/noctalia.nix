{
  desktop.noctalia = {
    nixos.programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    homeManager = { lib, pkgs, ... }: {
      programs.noctalia = {
        enable = true;
        settings = lib.fromTOML (
          builtins.readFile (
            pkgs.runCommand "noctalia-config-export" { } "${lib.getExe pkgs.noctalia} config export full > $out"
          )
        );
      };
    };
  };
}
