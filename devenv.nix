{
  pkgs,
  ...
}:

{
  packages = with pkgs; [
    nil
    nixfmt
    statix
    deadnix
  ];

  languages.nix.enable = true;
}
