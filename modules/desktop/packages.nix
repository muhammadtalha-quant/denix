{
  desktop.packages = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        newcomputermodern
      ];
      environment.systemPackages = with pkgs; [
        wl-mirror
        yq-go
        wev
        ddcutil
        wl-clipboard
        kanshi
      ];
    };
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        google-chrome
        nautilus
        papers
        showtime
        amberol
        file-roller
        loupe
        harlequin
        eza
        bat
        video-downloader
        ghgrab
      ];
    };
  };
}
