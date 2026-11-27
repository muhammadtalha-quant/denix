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

local vscode = require("vscode")
local opt = vim.opt
local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options --
vim.g.clipboard = vim.g.vscode_clipboard
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.timeoutlen = 2000

-- Clean slate: nothing persists between sessions
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = false
opt.shadafile = "NONE" -- no saved registers, marks or command history

-- Undo and redo (u, <C-r>) stay native
map({ "n", "x" }, "<Space>", "<Nop>")
map("n", "n", "nzz", { remap = true }) -- remap so zz can use an extension mapping
map("n", "N", "Nzz", { remap = true })
map("x", "p", "P") -- paste over a selection without overwriting the register
map("n", "<Esc>", "<Cmd>nohlsearch<CR>")


local function action(command)
  return function()
    vscode.action(command) -- async: Neovim doesn't wait for VS Code
  end
end

-- Side bars and panels
map("n", "<leader>e", action("workbench.view.explorer"))
map("n", "<leader>gg", action("workbench.view.scm"))
map("n", "<leader>pp", action("workbench.view.extensions"))
map("n", "<leader>bs", action("workbench.action.toggleSidebarVisibility"))
map("n", "<leader>ba", action("workbench.action.toggleAuxiliaryBar"))
map("n", "<leader>bb", action("workbench.action.togglePanel"))
map("n", "<leader>t", action("workbench.action.terminal.toggleTerminal"))

-- Debug sidebar + Debug Console (blocking calls keep the two in order)
map("n", "<leader>dd", function()
  vscode.call("workbench.view.debug")
  vscode.call("workbench.debug.action.toggleRepl")
end)

-- Find
map("n", "<leader>:", action("workbench.action.showCommands"))
map("n", "<leader>ff", action("workbench.action.quickOpen"))
map("n", "<leader>fr", action("workbench.action.openRecent"))
map("n", "<leader>fs", action("workbench.action.showAllSymbols"))
map("n", "<leader>sf", action("workbench.action.findInFiles"))
map("n", "<leader>fw", function()
  vscode.action("workbench.action.findInFiles", {
    args = { query = vim.fn.expand("<cword>") },
  })
end)

-- Code (built in already: gd gD gh K gH gO, = to format, gc to comment)
map({ "n", "x" }, "<leader>ca", action("editor.action.quickFix"))
map("n", "<leader>cr", action("editor.action.rename"))
map("n", "<leader>cf", action("editor.action.formatDocument"))

-- Problems: d = current file, q = whole workspace
map("n", "<leader>x", action("workbench.actions.view.problems"))
map("n", "[d", action("editor.action.marker.prev"))
map("n", "]d", action("editor.action.marker.next"))
map("n", "[q", action("editor.action.marker.prevInFiles"))
map("n", "]q", action("editor.action.marker.nextInFiles"))

-- Editors (buffers/tabs)
map("n", "<leader>w", action("workbench.action.files.save"))
map("n", "<leader>q", action("workbench.action.closeActiveEditor"))
map("n", "<leader>o", action("workbench.action.closeOtherEditors"))
map("n", "<leader>Q", action("workbench.action.closeAllEditors"))
map("n", "<leader>bl", action("workbench.action.showEditorsInActiveGroup"))
map("n", "<leader>bu", action("workbench.action.reopenClosedEditor"))
map("n", "[b", action("workbench.action.previousEditorInGroup"))
map("n", "]b", action("workbench.action.nextEditorInGroup"))

-- Splits (built in already: <C-w>v / <C-w>s split, <C-w>c close)
map({ "n", "x" }, "<C-h>", action("workbench.action.navigateLeft"))
map({ "n", "x" }, "<C-j>", action("workbench.action.navigateDown"))
map({ "n", "x" }, "<C-k>", action("workbench.action.navigateUp"))
map({ "n", "x" }, "<C-l>", action("workbench.action.navigateRight"))


local function setup(name, config)
  local ok, plugin = pcall(require, name)
  if ok then
    plugin.setup(config)
  end
  return ok
end

setup("mini.ai", { n_lines = 500 })

if setup("mini.surround") then -- default keys include sa, sd, sr
  
  map({ "n", "x" }, "s", "<Nop>")
end

'';

            vscode-nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
              luaRcContent = neovimRC;
              plugins = with pkgs.vimPlugins; [
                mini-surround
                mini-ai
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
          userSettings = {
            "breadcrumbs.enabled" = false;
            "chat.disableAIFeatures" = true;
            "direnv.restart.automatic" = true;
            "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
            "editor.detectIndentation" = false;
            "editor.formatOnSave" = true;
            "editor.insertSpaces" = true;
            "editor.lineNumbers" = "relative";
            "editor.minimap.enabled" = false;
            "editor.mouseWheelZoom" = true;
            "editor.smoothScrolling" = true;
            "editor.tabSize" = 4;
            "editor.wordWrap" = "on";
            "explorer.confirmDragAndDrop" = false;
            "extensions.experimental.affinity" = {
              "asvetliakov.vscode-neovim" = 1;
            };
            "files.autoSave" = "onFocusChange";
            "git.autoStash" = true;
            "git.autofetch" = true;
            "network.meteredConnection" = "off";
            "telemetry.editStats.details.enabled" = false;
            "telemetry.editStats.enabled" = false;
            "telemetry.feedback.enabled" = false;
            "window.density.layout" = "compact";
            "window.menuBarVisibility" = "compact";
            "workbench.activityBar.location" = "top";
            "workbench.colorTheme" = "Stylix";
            "workbench.editor.enablePreview" = false;
            "workbench.iconTheme" = "material-icon-theme";
            "workbench.productIconTheme" = "material-product-icons";
          };
          extensions = with pkgs.vscode-extensions; [
            asvetliakov.vscode-neovim
            jnoortheen.nix-ide
            mkhl.direnv
            pkief.material-icon-theme
            pkief.material-product-icons
          ];
        };
      };
    };
}
