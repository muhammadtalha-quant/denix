{
  desktop.vscode.homeManager =
    { lib, pkgs, ... }:
    let
      pluginDRV = pkgs.vimPlugins.friendly-snippets;
      snippetsJSON = (lib.fromJSON (lib.readFile "${pluginDRV}/package.json")).contributes.snippets;
      languages = map (
        snippet:
        if (builtins.isList snippet.language && builtins.length snippet.language == 1) then
          builtins.head snippet.language
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
      programs.vscode = {
        enable = true;
        package =
          let
            neovimRC = ''
              if not vim.g.vscode then
                  return
              end

              vim.g.mapleader = " "
              vim.g.maplocalleader = " "

              local opt = vim.opt

              opt.clipboard = "unnamedplus"

              opt.ignorecase = true
              opt.smartcase = true
              opt.incsearch = true
              opt.hlsearch = true

              opt.number = true
              opt.relativenumber = true
              opt.scrolloff = 8
              opt.sidescrolloff = 8
              opt.wrap = false
              opt.cursorline = true

              opt.tabstop = 4
              opt.shiftwidth = 4
              opt.softtabstop = 4
              opt.expandtab = true
              opt.smartindent = true

              opt.timeoutlen = 500
              opt.updatetime = 250

              opt.swapfile = false
              opt.backup = false
              opt.writebackup = false
              opt.undofile = false

              opt.signcolumn = "yes"
              opt.mouse = "a"

              -- Mini Surround
              local ok, mini_surround = pcall(require, "mini.surround")
              if ok then
                  mini_surround.setup({
                      mappings = {
                          add = "sa",
                          delete = "sd",
                          replace = "sr",
                      },
                  })
              end

              -- Mini AI
              local ok, mini_ai = pcall(require, "mini.ai")
              if ok then
                  mini_ai.setup({
                      n_lines = 500,
                  })
              end

              -- Mini Move
              local ok, mini_move = pcall(require, "mini.move")
              if ok then
                  mini_move.setup({
                      mappings = {
                          left = "<A-h>",
                          right = "<A-l>",
                          down = "<A-j>",
                          up = "<A-k>",
                      },
                  })
              end

              -- Mini Bracketed
              local ok, mini_bracketed = pcall(require, "mini.bracketed")
              if ok then
                  mini_bracketed.setup({
                      buffer = { suffix = "b" },
                      comment = { suffix = "c" },
                      diagnostic = { suffix = "d" },
                      file = { suffix = "f" },
                      oldfile = { suffix = "o" },
                      undo = { suffix = "u" },
                  })
              end

              local map = vim.keymap.set
              local vscode = require("vscode")

              local function action(name)
                  return function()
                      vscode.call(name)
                  end
              end

              map("n", "n", "nzzzv")
              map("n", "N", "Nzzzv")
              map("x", "p", "P")

              map("n", "<Esc>", "<cmd>nohlsearch<CR>")
              map("n", "<leader>w", "<cmd>write<CR>")

              -- Native undo / redo
              map("n", "u", "u")
              map("n", "<C-r>", "<C-r>")

              -- VS Code workbench
              map("n", "<leader>e", action("workbench.view.explorer"))
              map("n", "<leader>g", action("workbench.view.scm"))
              map("n", "<leader>pp", action("workbench.view.extensions"))
              map("n", "<leader>t", action("workbench.action.terminal.toggleTerminal"))
              map("n", "<leader>x", action("workbench.actions.view.problems"))
              map("n", "<leader>:", action("workbench.action.showCommands"))
              map("n", "<leader>sf", action("workbench.action.findInFiles"))
              map("n", "<leader>ff", action("workbench.action.quickOpen"))
              map("n", "<leader>sb", action("workbench.action.toggleSidebarVisibility"))
              map("n", "<leader>bp", action("workbench.action.togglePanel"))

              -- Debug sidebar + Debug Console
              map("n", "<leader>dd", function()
                  vscode.call("workbench.view.debug")
                  vscode.call("workbench.debug.action.toggleRepl")
              end)

              -- Editor management
              map("n", "<leader>q", action("workbench.action.closeActiveEditor"))
              map("n", "<leader>qo", action("workbench.action.closeOtherEditors"))
              map("n", "<leader>qa", action("workbench.action.closeAllEditors"))

            '';

            vscode-nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
              neovimRcContent = neovimRC;
              plugins = with pkgs.vimPlugins; [
                mini-surround
                mini-move
                mini-ai
                mini-bracketed
              ];
            };
          in
          pkgs.vscode-fhsWithPackages (ps: [
            vscode-nvim
          ]);
        mutableExtensionsDir = true;

        profiles.default = {
          mutableUserSettings = true;
          languageSnippets = langSnippets;
          globalSnippets = langSnippets.all;
          enableUpdateCheck = true;
          enableExtensionUpdateCheck = true;
          extensions = with pkgs.vscode-extensions; [
            asvetliakov.vscode-neovim
          ];
        };
      };
    };
}
