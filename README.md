# Denix

NixOS and Home Manager configurations built with [Den](https://den.denful.dev).

## Configuration

- Host: `hp-probook-430g2`
- Desktop: Hyprland, UWSM, and Noctalia
- Theming: Stylix
- Storage: Disko

Configurations are organized as reusable aspects and namespaces  under `modules/`.

### Repository Structure
```text
.
├── flake.lock
├── flake.nix
├── LICENSE
├── modules
│   ├── defaults.nix
│   ├── desktop
│   │   ├── _dotfiles
│   │   │   └── hyprland
│   │   │       ├── __keybinds__.lua
│   │   │       ├── animations.lua
│   │   │       ├── config.lua
│   │   │       ├── curves.lua
│   │   │       ├── events.lua
│   │   │       ├── gestures.lua
│   │   │       ├── keybinds
│   │   │       │   ├── applications.lua
│   │   │       │   ├── noctalia_shell.lua
│   │   │       │   ├── submaps.lua
│   │   │       │   ├── windows.lua
│   │   │       │   └── workspaces.lua
│   │   │       ├── lib
│   │   │       │   ├── helpers.lua
│   │   │       │   └── keys.lua
│   │   │       ├── monitors.lua
│   │   │       └── rules.lua
│   │   ├── environment.nix
│   │   ├── essentials.nix
│   │   ├── fish.nix
│   │   ├── hyprland.nix
│   │   ├── kitty.nix
│   │   ├── noctalia.nix
│   │   ├── packages.nix
│   │   ├── services.nix
│   │   ├── vcs.nix
│   │   ├── xdg.nix
│   │   └── zeditor.nix
│   ├── desktop.nix
│   ├── disko
│   │   └── ext4-simple.nix
│   ├── entry.nix
│   ├── extras
│   │   ├── theme.nix
│   │   └── virtualisation.nix
│   ├── hosts
│   │   ├── hp-probook-430g2.json
│   │   └── hp-probook-430g2.nix
│   ├── hosts.nix
│   ├── namespaces.nix
│   ├── nixos-core.nix
│   ├── schemas
│   │   ├── host-schema.nix
│   │   └── user-schema.nix
│   └── users
│       └── muhammadtalha.nix
└── README.md
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
