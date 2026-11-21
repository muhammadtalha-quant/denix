# Denix

A multi-host and mult-user NixOS only configuration based on [den](https://den.denful.dev) libs. It manages core operating system settings, alongside with per user home management embedded into operating system environment, powered by [home-manager](https://nix-community.github.io/home-manager)

## Configuration

- Host: `hp-probook-430g2`
- Desktop: [MangoWM](https://mangowm.github.io)  and [Noctalia](https://noctalia.dev)
- Theming: [Stylix](https://nix-community.github.io/stylix)
- Storage: [Disko](https://github.com/nix-community/disko)

Configurations are organized as reusable aspects and namespaces  under `modules/`.

### Repository Structure

```text
 .
├──  flake.lock
├──  flake.nix
├──  LICENSE
├──  modules
│   ├──  defaults.nix
│   ├──  desktop
│   │   ├──  _dotfiles
│   │   │   └──  mango
│   │   │       ├── 󱁻 binds.conf
│   │   │       ├── 󱁻 config.conf
│   │   │       ├── 󱁻 gestures.conf
│   │   │       ├── 󱁻 layouts.conf
│   │   │       ├── 󱁻 looknfeel.conf
│   │   │       ├── 󱁻 monitors.conf
│   │   │       └── 󱁻 rules.conf
│   │   ├──  environment.nix
│   │   ├──  essentials.nix
│   │   ├──  fish.nix
│   │   ├──  foot.nix
│   │   ├──  mangowm.nix
│   │   ├──  noctalia.nix
│   │   ├──  obsidian.nix
│   │   ├──  packages.nix
│   │   ├──  services.nix
│   │   ├──  vcs.nix
│   │   ├──  xdg.nix
│   │   └──  zeditor.nix
│   ├──  desktop.nix
│   ├──  disko
│   │   └──  ext4-simple.nix
│   ├──  entry.nix
│   ├──  extras
│   │   ├──  theme.nix
│   │   └──  virtualisation.nix
│   ├──  hosts
│   │   ├──  hp-probook-430g2.json
│   │   └──  hp-probook-430g2.nix
│   ├──  hosts.nix
│   ├──  namespaces.nix
│   ├──  nixos-core.nix
│   ├──  schemas
│   │   ├──  host-schema.nix
│   │   └──  user-schema.nix
│   └──  users
│       └──  muhammadtalha.nix
└── 󰂺 README.md
```

## Commands

Check the flake:

```bash
nix flake check
```

To update flake inputs, edit `modules/entry.nix` and regenerate `flake.nix`:

```bash
nix run .#write-flake
```

## License

[GPL-3.0](LICENSE)
