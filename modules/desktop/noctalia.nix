{
  desktop.noctalia = {
    nixos.programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    homeManager = {lib, ...}: {programs.noctalia = {
        enable = true;
        settings = lib.fromTOML (builtins.readFile ./_dotfiles/noctalia/config.toml);
    };
  };
};
}
