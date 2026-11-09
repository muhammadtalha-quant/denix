# Denix

A lightweight, aspect-oriented, multi-host NixOS and Home Manager configuration
built on [Den](https://den.denful.dev).

---

## Overview

Denix organizes system and user configurations using Den's Dendritic pattern.
Instead of monolithic host configurations or duplicated declarations, Denix
composes small, reusable **aspects** across custom namespaces (`desktop`,
`extras`, `disko`, and core `den.aspects`).

- **Primary Machine**: `hp-probook-430g2` (configured via `nixos-facter`)
- **Primary User**: `muhammadtalha`
- **Desktop Environment**: Wayland compositor Hyprland with UWSM session
  management and Noctalia desktop shell
- **Visual Theming**: Managed by [Stylix](https://github.com/nix-community/stylix)
  via `extras.theme` (`modules/extras/theme.nix`)
- **Core Editors**: Zed editor (`modules/desktop/zeditor.nix`) and `vim`

---

## Features

- **Aspect-Oriented Architecture**: Clean separation of system concerns
  (`nixos`) and user environments (`homeManager`) without duplication.
- **Wayland Desktop Experience**:
  - **Compositor**: Hyprland managed with UWSM and XWayland.
  - **Modular Dotfiles**: Modular Lua configs in
    `modules/desktop/_dotfiles/hyprland/` orchestrated by `__keybinds__.lua`.
  - **Desktop Shell**: Noctalia bar, control center, and audio visualizer,
    configured 100% in pure Nix (`modules/desktop/noctalia.nix`).
  - **Terminal**: Kitty terminal emulator with Fish and Nautilus integration.
- **Global Stylix Theming**: Curated themes configured in
  `modules/extras/theme.nix` with matching base16 color schemes, release
  wallpapers, Papirus icon color accents, and Bibata Modern Ice cursor:
  - `gruvbox-dark-medium` (default)
  - `gruvbox-light-medium`
  - `catppuccin-macchiato`
  - `catppuccin-latte`
- **Modern Developer Tooling**:
  - Zed editor configured with session restoration, Vim mode, and integrated
    language tooling: `nil`, `nixd`, `lua-language-server`, `statix`, `deadnix`,
    and `vscode-json-languageserver`.
  - Shell with Fish abbreviations, plugins, and `devenvit` for direnv and
    devenv integration.
  - Signed Git commits and tags via GPG and Lazygit.
- **Declarative Hardware & Storage**:
  - Hardware specifications discovered via `nixos-facter`
    (`modules/hosts/hp-probook-430g2.json`).
  - Storage partitioning defined declaratively with Disko
    (`modules/disko/ext4-simple.nix`).

---

## Repository Structure

```text
denix/
├── flake.nix                       # Managed by flake-file (DO-NOT-EDIT)
├── flake.lock                      # Resolved dependency lockfile
├── .luarc.json                     # Lua workspace definition for Hyprland
├── .agents/
│   └── instructions.md             # Guide and guardrails for AI agents
└── modules/
    ├── entry.nix                   # Flake input declarations (flake-file)
    ├── namespaces.nix              # Den namespace registrations
    ├── defaults.nix                # Base batteries and system defaults
    ├── nixos-core.nix              # Common NixOS configuration aspect
    ├── desktop.nix                 # Desktop aggregator aspect
    ├── hosts.nix                   # Host records and per-host user data
    ├── schemas/                    # Type contracts for hosts and users
    │   ├── host-schema.nix
    │   └── user-schema.nix
    ├── hosts/                      # Host-specific aspects and facter data
    │   ├── hp-probook-430g2.nix
    │   └── hp-probook-430g2.json
    ├── users/                      # Reusable user composition
    │   └── muhammadtalha.nix
    ├── desktop/                    # Modular desktop aspects
    │   ├── _dotfiles/hyprland/     # Modular Hyprland Lua configs
    │   ├── hyprland.nix
    │   ├── noctalia.nix
    │   ├── zeditor.nix
    │   ├── kitty.nix
    │   ├── fish.nix
    │   ├── vcs.nix
    │   ├── essentials.nix
    │   ├── services.nix
    │   ├── packages.nix
    │   ├── environment.nix
    │   └── xdg.nix
    ├── extras/                     # Optional system capabilities
    │   ├── theme.nix               # Stylix global theming aspect
    │   └── virtualisation.nix      # Libvirtd and QEMU/KVM
    └── disko/                      # Declarative storage layouts
        └── ext4-simple.nix
```

---

## Daily Operations & Commands

System maintenance commands are available via Fish shell aliases powered by `nh`:

| Command        | Description                                           |
| :------------- | :---------------------------------------------------- |
| `nixos-switch` | Build and activate configuration immediately          |
| `nixos-boot`   | Build and set configuration as next boot default      |
| `nixos-test`   | Test configuration activation without boot entry      |
| `nixos-update` | Update flake inputs across the configuration          |
| `repl`         | Open interactive Nix REPL with `pkgs` and `lib` ready |
| `devenvit`     | Initialize project development env (`direnv`+`devenv`)|
| `nixos-purge`  | Clean older profiles and optimize the Nix store       |

### Flake Validation & Input Updates

- **Validate Configuration**:

  ```bash
  nix flake check
  ```

- **Update Flake Inputs**:
  Declare changes in `modules/entry.nix` under `flake-file.inputs`, then
  regenerate `flake.nix`:

  ```bash
  nix run .#write-flake
  ```

---

## License

This project is licensed under the terms of the GNU General Public License v3.0.
See [LICENSE](file:///home/muhammadtalha/denix/LICENSE) for details.
