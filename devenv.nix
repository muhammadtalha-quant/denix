{
  pkgs,
  ...
}:

{
  packages = with pkgs; [
    statix
    nixfmt
    markdownlint-cli2
    marksman
  ];

  languages.nix = {
    enable = true;
    lsp.package = pkgs.nil;
  };
  scripts.zed.exec = "zeditor .";
}
