{ inputs, ... }: {
  desktop.vscodium.homeManager =
    { lib, pkgs, ... }:
    let
      pluginDRV = pkgs.vimPlugins.friendly-snippets;
      snippetsJSON = (lib.fromJSON (lib.readFile "${pluginDRV}/package.json")).contributes.snippets;
      languages = map (
        snippet:
        if (builtins.isList snippet.language && builtins.length snippet.language == 1) then
          lib.toString snippet.language
        else
          snippet.language
      ) snippetsJSON;
      snippets = map (snippetPath: lib.fromJSON (lib.readFile snippetPath)) (
        map (prefixlessAbsolutePath: "${pluginDRV}/" + prefixlessAbsolutePath) (
          map (relativePath: lib.removePrefix "./" relativePath) (map (snippet: snippet.path) snippetsJSON)
        )
      );
      langSnippets = builtins.foldl' lib.recursiveUpdate { } (
        lib.flatten (
          lib.zipListsWith (
            lang: snippet:
            if builtins.isList lang then
              (map (ilang: { "${ilang}" = snippet; }) lang)
            else
              { "${lang}" = snippet; }
          ) languages snippets
        )
      );
    in
    {
      nixpkgs.overlays = [
        inputs.vscode-extensions.overlays.default
      ];
      programs.vscodium = {
        enable = true;
        package = pkgs.vscodium-fhs;
        mutableExtensionsDir = true;
        profiles.default =
          let
            # vsmp = pkgs.nix-vscode-extensions.vscode-marketplace;
            ovsx = pkgs.nix-vscode-extensions.open-vsx;
          in
          {
            mutableUserSettings = true;
            languageSnippets = langSnippets;
            globalSnippets = langSnippets.all;
            extensions = [
              ovsx.jnoortheen.nix-ide
              # ovsx.
              # quarto.quarto
              # redhat.vscode-yaml
              # ms-vscode.cmake-tools
              # llvm-vs-code-extensions.vscode-clangd
              # llvm-vs-code-extensions.lldb-dap
              # ms-python.python
              # ms-python.debugpy
              # charliermarsh.ruff
              # detachhead.basedpyright
              # ms-toolsai.jupyter
              # bierner.markdown-checkbox
              # bierner.markdown-emoji
              # bierner.markdown-footnotes
            ];
            enableUpdateCheck = true;
            enableExtensionUpdateCheck = true;
          };
      };
    };
}
