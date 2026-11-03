{
  desktop.packages = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        newcomputermodern
        inter
        noto-fonts
        nerd-fonts.jetbrains-mono
        noto-fonts-color-emoji
      ];
      environment.systemPackages = with pkgs; [
        ripgrep
        adw-gtk3
      ];

    };
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        pipes
        wl-clipboard
        fastfetch
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
        gh
        claude-code
        _9router
      ];
    };
  };
}
