{
  desktop.neovim.homeManager = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins; [
        mini-surround
        mini-move
        mini-ai
        mini-bracketed
      ];
      initLua = ''
        vim.o.clipboard = "unnamedplus" 
        vim.o.ignorecase = true         
        vim.o.smartcase = true          
        vim.o.timeoutlen = 3000          
        vim.o.updatetime = 250          
        vim.o.scrolloff = 8             

        vim.o.number = true             
        vim.o.relativenumber = true     
        vim.o.tabstop = 4               
        vim.o.shiftwidth = 4            
        vim.o.expandtab = true          
        vim.o.smartindent = true        

        vim.keymap.set('n', 'n', 'nzzzv')  
        vim.keymap.set('n', 'N', 'Nzzzv')
        vim.keymap.set('x', 'p', 'P') 


        local status_surround, mini_surround = pcall(require, 'mini.surround')
        if status_surround then
          mini_surround.setup({
            mappings = {
              add = 'sa',        
              delete = 'sd',     
              replace = 'sr',    
            },
          })
        end

        local status_ai, mini_ai = pcall(require, 'mini.ai')
        if status_ai then
          mini_ai.setup({ n_lines = 500 }) 
        end

        local status_comment, mini_comment = pcall(require, 'mini.comment')
        if status_comment then
          mini_comment.setup()
        end

        local status_move, mini_move = pcall(require, 'mini.move')
        if status_move then
          mini_move.setup({
            mappings = {
              left  = '<A-h>',
              right = '<A-l>',
              down  = '<A-j>',
              up    = '<A-k>',
            },
          })
        end

        local status_bracketed, mini_bracketed = pcall(require, 'mini.bracketed')
        if status_bracketed then
          mini_bracketed.setup({
            buffer     = { suffix = 'b', options = {} },
            comment    = { suffix = 'c', options = {} },
            conflict   = { suffix = 'x', options = {} },
            diagnostic = { suffix = 'd', options = {} },
            file       = { suffix = 'f', options = {} },
            indent     = { suffix = 'i', options = {} },
            jump       = { suffix = 'j', options = {} },
            location   = { suffix = 'l', options = {} },
            oldfile    = { suffix = 'o', options = {} },
            quickfix   = { suffix = 'q', options = {} },
            treesitter = { suffix = 't', options = {} },
            undo       = { suffix = 'u', options = {} },
          })
        end
      '';
    };
  };
}
