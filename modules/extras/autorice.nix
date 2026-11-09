{ inputs, ... }:
{
  # A namespaced paramterized aspect that takes two parameters, i-e wallpaper to build drv and polarity
  # and then use both to generate a base16 palette to theme everything in the whole system.
  extras.autorice = wallpaper: polarity: {
    nixos =
      {
        lib,
        pkgs,
        ...
      }:
      let
        wallpapers = {
          balcony = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/balcony.png";
            hash = "sha256-Z9c29b4jXZfYWFb3GQ7id8wsXEmJtTZZPtCqmoVi3Eo=";
          };
          samurai = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/samurai.png";
            hash = "sha256-aSUxTIkd+/k4PUST6r4uPX2PPyynY4VDAO7yeFi+4xc=";
          };
          redcity = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/redcity.png";
            hash = "sha256-WFJimdHgwxT7mb+uC9Tc+NTKzWt1DTdXY4+ItCmycKo=";
          };
          painting = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/painting.png";
            hash = "sha256-5VDMN/OL3YnxUk6QLf5T1mC2b5p9KgcHqHTWlnubgzE=";
          };
          gruvbox = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/gruvbox.png";
            hash = "sha256-pXlwsQrcfIXFMoLBAvViaStQY/BozRuLHLgxoAbu0SI=";
          };
          valley = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/valley.png";
            hash = "sha256-9PsbUZxOqZpzbXJ3EvUXjVWlq7hQp3LJPh7xrhOMFFs=";
          };
          deer = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/deer.png";
            hash = "sha256-DknTf2htvJQgNx9jhXiO+9BUPMqxx6FWJ/UiA5bfu1k=";
          };
          horses = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/horses.png";
            hash = "sha256-S018FoO09IvZFfWw+qhlV2HesUhYoQaWFCXvTVfXjh4=";
          };
          war = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/war.png";
            hash = "sha256-pgzTP5svW4wPWxGT/zrsnkrWP1rOh3TtKbzjGjP1cPI=";
          };
          cliff = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/cliff.png";
            hash = "sha256-9TFmrvih7ZyfCakRZ3E04iIXel7XkKGDt362wFxQl20=";
          };
          sakura = pkgs.fetchurl {
            url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/sakura.png";
            hash = "sha256-nFtCT314ZGGKyhhaa7meQG5sum/kVMO5k/x6W1LWUNc=";
          };
        };
      in
      {
        assertions = [
          {
            assertion = lib.hasAttr "${wallpaper}" wallpapers;
            message = "\"${wallpaper}\" is not in [ ${lib.toString (lib.attrNames wallpapers)} ]";
          }
        ];
        imports = [
          inputs.stylix.nixosModules.stylix
        ];
        stylix = {
          overlays.enable = false;
          enable = true;
          image = wallpapers."${wallpaper}";
          inherit polarity;
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
