{ extras, desktop, ... }: {
  den.aspects.swaywm-desktop = {
    includes = [
      desktop.sway
      desktop.xdg
      desktop.foot
      desktop.obsidian
      desktop.vscode
      desktop.noctalia
      desktop.environment
      desktop.essentials
      desktop.services
      desktop.packages
      desktop.fish
      desktop.vcs
      (extras.theme "catppuccin-macchiato")
    ];
  };
}
