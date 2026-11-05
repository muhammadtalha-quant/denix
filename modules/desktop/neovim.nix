{ inputs, ... }: {
  desktop.neovim.nixos = {
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
        fzf-lua.enable = true;
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
        diagnostics.enable = true;
        diagnostics.config.virtual_lines = true;
        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
          trouble.enable = true;
        };
        binds.whichKey = {
          enable = true;
          setupOpts.preset = "helix";
        };
        notes.todo-comments.enable = true;
        notify.nvim-notify.enable = true;
        debugger = {
          nvim-dap.enable = true;
          nvim-dap.ui.enable = true;
        };
        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
        };

        filetree.neo-tree.enable = true;
        visuals = {
          blink-indent.enable = true;
          fidget-nvim.enable = true;
          neoscroll-nvim.enable = true;
          nvim-cursorline.enable = true;
          nvim-web-devicons.enable = true;
          tiny-devicons-auto-colors.enable = true;
        };
        git.gitsigns.enable = true;
        utility.grug-far-nvim.enable = true;
        statusline.lualine = {
          enable = true;
          integrations.breadcrumbs = {
            nvim-navic.enable = true;
            vanilla.separator.symbol = " > ";
          };
        };
        tabline.nvimBufferline = {
          enable = true;
          mappings = {
            closeCurrent = "<leader>bd";
            cycleNext = "]b";
            cyclePrevious = "[b";
            moveNext = "]B";
            movePrevious = "[B";
            pick = null;
          };
        };
        mini = {
          ai.enable = true;
          pairs.enable = true;
          basics.enable = true;
          surround.enable = true;
          hipatterns.enable = true;
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
      };
    };
  };
}
