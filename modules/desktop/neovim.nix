{ inputs, ... }: {
  desktop.neovim.nixos = { lib, pkgs, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];
    programs.nvf = {
      enable = true;
      enableManpages = true;
      vim = {
        additionalRuntimePaths = [
          "${pkgs.vimPlugins.friendly-snippets}"
        ];
        options = {
          tabstop = 4;
          shiftwidth = 4;
        };
        navigation.harpoon = {
          enable = true;
          mappings = {
            listMarks = "<leader>fl";
            markFile = "<leader>f";
            file1 = "<C-1>";
            file2 = "<C-2>";
            file3 = "<C-3>";
            file4 = "<C-4>";
          };
        };
        mini = {
          ai.enable = true;
          pairs.enable = true;
          icons.enable = true;
          files.enable = true;
          visits.enable = true;
          completion.enable = true;
          snippets = {
            enable = true;
            setupOpts.snippets = [
              (lib.generators.mkLuaInline ''
                require("mini.snippets").gen_loader.from_lang()
              '')
            ];
          };
          statusline.enable = true;
          tabline.enable = true;
          notify.enable = true;
          basics.enable = true;
          starter.enable = true;
          sessions.enable = true;
          animate.enable = true;
          surround.enable = true;
          hipatterns.enable = true;
          cursorword.enable = true;
          bracketed.enable = true;
          cmdline.enable = true;
        };
      };
    };
  };
}
