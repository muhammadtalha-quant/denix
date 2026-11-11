{ extras, desktop, ... }: {
  den.aspects.hyprland-desktop = {
    includes = [
      desktop.hyprland
      desktop.xdg
      desktop.kitty
      desktop.obsidian
      desktop.zeditor
      desktop.noctalia
      desktop.environment
      desktop.essentials
      desktop.services
      desktop.packages
      desktop.fish
      desktop.vcs
      (extras.theme "gruvbox-dark-medium")
    ];
  };
}
