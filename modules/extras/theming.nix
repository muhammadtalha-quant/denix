{ inputs, ... }:
let
  macchiato = { pkgs }: {
    overlays.enable = false;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    image = pkgs.fetchurl {
      url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/macchiato.png";
      hash = "sha256-W8aHVqQvinbkB3v/xOXhCLii+L/A8LK7Fp/u3JaoyRM=";
    };
    polarity = "dark";
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
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "mauve";
      };
      dark = "Papirus-Dark";
    };
    cursor = {
      name = "catppuccin-macchiato-mauve-cursors";
      package = pkgs.catppuccin-cursors.macchiatoMauve;
      size = 26;
    };
  };
  latte = { pkgs }: {
    overlays.enable = false;
    enable = true;
    image = pkgs.fetchurl {
      url = "https://github.com/muhammadtalha-quant/denix/releases/download/latest/latte.jpg";
      hash = "sha256-5K7fl7bn4sIjMoaS8kjwymlvJXE0o/2rg0PTbo1SsTk=";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    polarity = "light";
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
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "latte";
        accent = "mauve";
      };
      light = "Papirus-Light";
    };
    cursor = {
      name = "catppuccin-latte-mauve-cursors";
      package = pkgs.catppuccin-cursors.latteMauve;
      size = 26;
    };
  };
  default = {
    enable = false;
  };
in
{
  extras.theme-catppuccin = variant: {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];
      stylix =
        if variant == "light" then
          latte { inherit pkgs; }
        else if variant == "dark" then
          macchiato { inherit pkgs; }
        else
          default;
    };
  };
}
