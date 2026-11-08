{ extras, desktop, ... }: {
  den.aspects.hyprland-desktop = {
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
      (extras.autorice "balcony" "dark")
    ];
  };
}
