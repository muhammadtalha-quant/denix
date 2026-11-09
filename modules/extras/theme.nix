{ inputs, ... }:
{
  # A namespaced paramterized aspect that takes two parameters, i-e wallpaper to build drv and polarity
  # and then use both to generate a base16 palette to theme everything in the whole system.
  extras.theme = theme: {
    nixos =
      {
        lib,
        pkgs,
        ...
      }:
      let
        themes = {
          catppuccin-macchiato = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/catppuccin-macchiato.png";
            hash = "sha256-NYSJAnfgIeMFEWk+PxlhHvepOP1NWui30lsDTncuNzo=";
          };
          catppuccin-latte = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/catppuccin-latte.png";
            hash = "sha256-zIYWPS/YrSLAzgqlEbfKsWhVFoYiBbQxPsWZvPzBkdk=";
          };
          gruvbox-light-medium = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/gruvbox-light-medium.png";
            hash = "sha256-6f+hvub5Lv2vi3Alf4W78FH8tPKL59rJ/aO+Hb2l78c=";
          };
          gruvbox-dark-medium = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/gruvbox-dark-medium.png";
            hash = "sha256-pXlwsQrcfIXFMoLBAvViaStQY/BozRuLHLgxoAbu0SI=";
          };
        };
      in
      {
        imports = [
          inputs.stylix.nixosModules.stylix
        ];
        stylix = {
          overlays.enable = false;
          enable = true;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
          image = themes."${theme}";
          polarity =
            if (theme == "catppuccin-macchiato" || theme == "gruvbox-dark-medium") then
              "dark"
            else if (theme == "catppuccin-latte" || theme == "gruvbox-light-medium") then
              "light"
            else
              null;
          fonts = {
            serif = {
              package = pkgs.noto-fonts;
              name = "Noto Sans";
            };

            sansSerif = {
              package = pkgs.inter;
              name = "Inter Variable";
            };

            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrainsMono Nerd Font Mono";
            };

            emoji = {
              package = pkgs.noto-fonts-color-emoji;
              name = "Noto Color Emoji";
            };
          };
          icons = {
            enable = true;
            package = pkgs.papirus-icon-theme;
            dark = "Papirus-Dark";
            light = "Papirus-Dark";
          };
          cursor = {
            name = "Bibata-Modern-Amber";
            package = pkgs.bibata-cursors;
            size = 26;
          };
        };
      };
  };
}
