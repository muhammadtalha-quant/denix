{ inputs, ... }: {
  desktop.neovim.nixos = { lib, pkgs, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];
    programs.nvf = {
      enable = true;
      enableManpages = true;
      settings.vim = {
        keymaps = [
          {
            key = "<Esc>";
            mode = "n";
            silent = true;
            action = ":noh";
          }
        ];
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
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
        diagnostics.enable = true;
        lsp.enable = true;
        lsp.formatOnSave = true;
        debugger = {
          nvim-dap.enable = true;
          nvim-dap.ui.enable = true;
        };
        utility.grug-far-nvim.enable = true;
        mini = {
          ai.enable = true;
          pick.enable = true;
          git.enable = true;
          bufremove.enable = true;
          pairs.enable = true;
          icons.enable = true;
          clue.enable = true;
          indentscope.enable = true;
          files.enable = true;
          completion.enable = true;
          snippets = {
            enable = true;
            setupOpts.snippets = [
              (lib.generators.mkLuaInline ''
                require("mini.snippets").gen_loader.from_file("${pkgs.vimPlugins.friendly-snippets}/snippets/global.json")
              '')
              (lib.generators.mkLuaInline ''
                require("mini.snippets").gen_loader.from_lang()
              '')
            ];
          };
          extra.enable = true;
          statusline.enable = true;
          tabline.enable = true;
          notify.enable = true;
          basics.enable = true;
          animate.enable = true;
          surround.enable = true;
          hipatterns.enable = true;
          cursorword.enable = true;
          bracketed.enable = true;
          cmdline.enable = true;
        };
        languages = {
          enableDAP = true;
          enableExtraDiagnostics = false;
          enableFormat = true;
          enableTreesitter = true;
          nix = {
            enable = true;
            format.type = [ "nixfmt" ];
          };
          markdown = {
            enable = true;
            extensions.render-markdown-nvim.enable = true;
            format.type = [ "rumdl" ];
            lsp.servers = [ "rumdl" ];
          };
          clang = {
            enable = true;
            cHeader = true;
          };
          cmake.enable = true;
          python = {
            enable = true;
            lsp.servers = [ "ty" ];
            format.type = [ "ruff" ];
          };
          json.enable = true;
          toml = {
            enable = true;
            lsp.servers = [ "tombi" ];
            format.type = [ "tombi" ];
          };
          yaml.enable = true;
          typst = {
            enable = true;
            extensions.typst-preview-nvim.enable = true;
          };
        };
        luaConfigPost = ''
          require("mini.snippets").start_lsp_server()
        '';
      };
    };
  };
}
