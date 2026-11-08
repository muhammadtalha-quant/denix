{
  desktop.zeditor.homeManager = { pkgs, ... }: {
    programs.zed-editor = {
      enable = true;
      installRemoteServer = true;
      extraPackages = with pkgs; [
        nixfmt
        nil
        statix
        deadnix
        vscode-json-languageserver
        package-version-server
      ];
      userSettings = { };
      userKeymaps = { };
    };
  };
}
