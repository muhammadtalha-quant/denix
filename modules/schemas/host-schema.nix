{
  den.schema.host = { lib, ... }: {
    options = {
      stateVersion = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      hashedPasswordRoot = lib.mkOption {
        type = lib.types.str;
        default = "$y$j9T$JMDotg00nZgcO/UsBUVjH1$8yU7JWkNluPN6Svjoi8WBwQ24JZOxwT3XZDQzUI52j8"; # 0
      };
      timeZone = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
      flakePath = lib.mkOption {
        type = lib.types.str;
        default = "/etc/nixos";
      };
      withLocalSSH = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      withTailscaleSSH = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      withFHSCompat = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      allowedTCPPorts = lib.mkOption {
        type = lib.types.listOf lib.types.port;
        default = [ ];
      };
      allowedUDPPorts = lib.mkOption {
        type = lib.types.listOf lib.types.port;
        default = [ ];
      };
      disko = lib.mkOption {
        type = lib.types.submodule {
          options = {
            device = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
            swapSize = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
          };
        };
      };
    };
  };
}
