{
  desktop.services = {
    nixos = {
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
        syncthing = {
          enable = true;
          overrideFolders = false;
          overrideDevices = false;
          openDefaultPorts = true;
        };
      };
      security = {
        rtkit.enable = true;
        pam.services.ly = {
          enableGnomeKeyring = true;
          fprintAuth = true;
        };
      };
    };
    homeManager = { };
  };
}
