{
  den.aspects.hyde = { user, ... }: {
    nixos = { pkgs, ... }: {
      environment = {
        sessionVariables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
          QT_QPA_PLATFORM = "wayland;xcb";
          NIXOS_OZONE_WL = "1";
          GDK_BACKEND = "wayland,x11,*";
          SDL_VIDEODRIVER = "wayland";
          CLUTTER_BACKEND = "wayland";
          QT_AUTO_SCREEN_SCALE_FACTOR = "1";
          QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        };
      };
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
        nix-ld.enable = true;
        noctalia = {
          enable = true;
          recommendedServices.enable = true;
          systemd = {
            enable = true;
            target = "hyprland-session.target";
          };
        };
        localsend.enable = true;
        seahorse.enable = true;
        nautilus-open-any-terminal = {
          enable = true;
          terminal = "kitty";
        };
        gpu-screen-recorder.enable = true;
        gnupg.agent.pinentryPackage = pkgs.pinentry-gnome3;
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
        lazygit.enable = true;
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
        kitty = {
          enable = true;
          settings = {
            remember_window_size = false;
            cursor_trail = 1;
            confirm_os_window_close = 0;
            enable_audio_bell = false;
            scrollback = "never";
            notify_on_cmd_finish = "invisible 5.0";
            hide_window_decorations = "yes";
            scrollback_lines = 100000;
          };
          shellIntegration.enableFishIntegration = true;
          enableGitIntegration = true;
          keybindings = {
            "ctrl+shift+c" = "copy_to_clipboard";
            "ctrl+shift+v" = "paste_from_clipboard";
            "ctrl+shift+up" = "scroll_line_up";
            "ctrl+shift+down" = "scroll_line_down";
            "page_up" = "scroll_page_up";
            "page_down" = "scroll_page_down";
            "ctrl+shift+enter" = "no_op";
            "ctrl+alt+enter" = "no_op";
            "ctrl+alt+left" = "no_op";
            "ctrl+shift+t" = "no_op";
            "ctrl+shift+q" = "no_op";
            "ctrl+alt+right" = "no_op";
            "ctrl+alt+up" = "no_op";
            "ctrl+alt+down" = "no_op";
            "ctrl+shift+home" = "no_op";
            "ctrl+left" = "no_op";
            "ctrl+right" = "no_op";
            "ctrl+up" = "no_op";
            "ctrl+down" = "no_op";
            "ctrl+shift+equal" = "change_font_size all +2.0";
            "ctrl+shift+minus" = "change_font_size all -2.0";
            "ctrl+shift+backspace" = "change_font_size all 0";
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
        git = {
          enable = true;
          signing = {
            key = user.publicGPGKey;
            format = "openpgp";
            signByDefault = true;
            signer = "${pkgs.gnupg}/bin/gpg2";
          };
          settings = {
            init = {
              defaultBranch = "main";
            };
            commit = {
              gpgSign = true;
            };
            tag = {
              gpgSign = true;
            };
            user = {
              name = user.realName;
              email = user.emailAddress;
              useConfigOnly = true;
            };
            credential = {
              "https://github.com" = {
                helper = "${pkgs.gh}/bin/gh auth git-credential";
              };
              "https://gist.github.com" = {
                helper = "${pkgs.gh}/bin/gh auth git-credential";
              };
            };
            http = {
              version = "HTTP/1.1";
              postBuffer = 524288000;
              lowSpeedLimit = 1000;
              lowSpeedTime = 600;
            };
          };
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
