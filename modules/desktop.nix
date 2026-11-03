{ desktop, ... }: {
  den.aspects.hyprland-desktop = { user, ... }: {
    includes = [
      desktop.hyprland
      desktop.xdg
      desktop.kitty
      desktop.noctalia
      desktop.environment
      desktop.essentials
      desktop.services
      desktop.packages
      desktop.fish
      desktop.vcs
      desktop.neovim
    ];
  };
}
