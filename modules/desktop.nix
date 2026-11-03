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
        noctalia = {
          enable = true;
          recommendedServices.enable = true;
          systemd = {
            enable = true;
            target = "hyprland-session.target";
          };
        };
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
          settings = {
            version = 1;
            shell = {
              prompt_prefix = false;
            };
            tui = {
              statusline.enabled = false;
            };
          };
        };
        noctalia = {
          enable = true;
          systemd.enable = true;
          settings = ./_dotfiles/noctalia/config.toml;
        };
        cava = {
          enable = true;
        };
        btop = {
          enable = true;
          settings = {
            update_ms = 100;
          };
        };
        neovim = {
          enable = true;
          # lazyvim core dependencies
          extraPackages = with pkgs; [
            tree-sitter
            ripgrep
            curl
            fzf
            fd
            gcc
          ];
          sideloadInitLua = true;
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
      xdg = {
        portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-hyprland
          ];
          config = {
            common = {
              default = [
                "hyprland"
                "gtk"
              ];
              "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
              "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
              "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
            };
          };
        };
        userDirs.enable = true;
        userDirs.createDirectories = true;
        localBinInPath = true;
        configFile = {
          "zellij" = {
            source = ./_dotfiles/zellij;
            force = true;
            recursive = true;
          };
          "nvim" = {
            source = ./_dotfiles/nvim;
            force = true;
            recursive = true;
          };
          "fastfetch" = {
            source = ./_dotfiles/fastfetch;
            recursive = true;
            force = true;
          };
        };
      };
      gtk = {
        enable = true;
        font = {
          name = "Inter Variable";
          package = pkgs.inter;
          size = 11;
        };
        iconTheme = {
          package = pkgs.papirus-icon-theme;
          name = "Papirus";
        };
      };
      qt = {
        enable = true;
        platformTheme = {
          name = "qtct";
          package = with pkgs; [
            qt6Packages.qt6ct
            libsForQt5.qt5ct
          ];
        };
      };
      fonts.fontconfig = {
        enable = true;
        antialiasing = true;
        defaultFonts = {
          monospace = [ "Noto Sans" ];
          sansSerif = [ "Inter Variable" ];
          serif = [ "JetBrainsMono Nerd Font Mono" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
