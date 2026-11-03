{
  desktop.essentials = {
    nixos = {
      programs = {
        localsend.enable = true;
        gpu-screen-recorder.enable = true;
      };
    };
    homeManager = {
      programs = {
        starship = {
          enable = true;
          enableFishIntegration = true;
        };
        devenv = {
          enable = true;
          enableFishIntegration = true;
        };
        cava.enable = true;
        btop = {
          enable = true;
          settings = {
            update_ms = 100;
          };
        };
        television = {
          enable = true;
          enableFishIntegration = true;
        };
        nix-search-tv = {
          enable = true;
          enableTelevisionIntegration = true;
        };
      };
    };
  };
}
