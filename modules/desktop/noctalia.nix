{
  desktop.noctalia = {
    nixos.programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    homeManager.programs.noctalia = {
        enable = true;
        settings = ./_dotfiles/noctalia/config.toml;
    };
  };
}
