{
  desktop.packages = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        newcomputermodern
      ];
      environment.systemPackages = [ ];

    };
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        pipes
        wl-clipboard
        cmatrix
        google-chrome
        obsidian
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
        zellij
        claude-code
        _9router
      ];
    };
  };
}
