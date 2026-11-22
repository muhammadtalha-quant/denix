{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
stdenv = pkgs.stdenvNoCC;
languages.nix.enable = true;
}
