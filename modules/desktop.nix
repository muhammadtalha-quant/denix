{
  den.aspects.hyde = { user, ... }: {
    nixos = { pkgs, ... }: {
      services = {
        power-profiles-daemon.enable = true;
        upower.enable = true;
        fprintd.enable = true;
        udisks2.enable = true;
        gnome.gnome-keyring.enable = true;
        gvfs.enable = true;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };
        displayManager.ly.enable = true;
        libinput.enable = true;
        pcscd.enable = true;
      };
      security = {
        rtkit.enable = true;
        pam.services.ly = {
          enableGnomeKeyring = true;
          fprintAuth = true;
        };
      };
      programs = {
        localsend.enable = true;
        gpu-screen-recorder.enable = true;
      };
    };
    homeManager = { pkgs, ... }: {
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
