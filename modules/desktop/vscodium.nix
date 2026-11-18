{
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
      programs.vscodium = {
        enable = true;
        package = pkgs.vscodium-fhs;
        mutableExtensionsDir = true;
        profiles.default = {
          mutableUserSettings = true;
          languageSnippets = langSnippets;
          globalSnippets = "${pluginDRV}/snippets/global.json";
          enableUpdateCheck = true;
          enableExtensionUpdateCheck = true;
        };
      };
    };
}
