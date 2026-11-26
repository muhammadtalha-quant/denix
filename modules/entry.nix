{ inputs, lib, ... }: {
  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];

  flake-file.inputs = {
    flake-file.url = lib.mkDefault "github:denful/flake-file";
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
      url = "github:hercules-ci/flake-parts";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    nixpkgs-lib.follows = "nixpkgs";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };
  };
  flake-file.do-not-edit = ''
    #
    #
    #                                    ##### DISCLAIMER BEGIN #####
    # This flake file was automatically generated and is not intended for direct edits.
    # It defines inputs and outputs, it is not advised to edit outputs if you don't understand flakes, flake-parts and dendritic pattern.
    # If you want to add inputs to your flake file, add your inputs to `modules/entry.nix` inside flake-file.inputs = { ... } attribute set.
    # To persist your edits, run `nix run .#write-flake` in repository root to generate new flake.nix from `modules/entry.nix`.
    #                                    ##### DISCLAIMER END #####
    #
    #
  '';
}
