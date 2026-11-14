{
  desktop.packages = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        newcomputermodern
      ];
      environment.systemPackages = [
        pkgs.zlib
        pkgs.wlr-randr
      ];
    };
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        wl-clipboard
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
        claude-code
        _9router
        ghgrab
      ];
    };
  };
}
