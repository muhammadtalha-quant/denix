{
  inputs,
  lib,
  den,
  ...
}:
{
  den = {
    default = {
      includes = [
        den.batteries.hostname
        den.batteries.define-user
      ];

      nixos = { host, ... }: {
        imports = [
          inputs.home-manager.nixosModules.home-manager
        ];
        nixpkgs.config.allowUnfree = true;
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
        system.stateVersion = host.stateVersion;
      };
      homeManager = { host, ... }: {
        programs.home-manager.enable = true;
        home.pointerCursor.enable = true;
        home.stateVersion = host.stateVersion;
      };
    };

    schema.user.classes = lib.mkDefault [ "homeManager" ];
    schema.host.includes = [ den.aspects.nixos-core ];
  };
}
