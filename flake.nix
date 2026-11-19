#                                    ##### DISCLAIMER BEGIN #####
# This flake file was automatically generated and is not intended for direct edits.
# It defines inputs and outputs, it is not advised to edit outputs if you don't understand flakes, flake-parts and dendritic pattern.
# If you want to add inputs to your flake file, add your inputs to `modules/entry.nix` inside flake-file.inputs = { ... } attribute set.
# To persist your edits, run `nix run .#write-flake` in repository root to generate new flake.nix from `modules/entry.nix`.
#                                    ##### DISCLAIMER END #####
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    den.url = "github:denful/den";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-file.url = "github:denful/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    nixpkgs-lib.follows = "nixpkgs";
    stylix = {
      url = "github:nix-community/stylix";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };
}
