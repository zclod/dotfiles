return {
--  External Dependencies:
--    fzf
--    ripgrep
--    sad
--      fd
--      delta
--    nerdfonts (for web-dev-icons)

  -- Fuzzy Finder (files, lsp, etc)
  {'ibhagwan/fzf-lua', config = function() require("fzf-lua").register_ui_select() end},

  -- File explorer
  {'nvim-tree/nvim-tree.lua', opts = {}, event = "VeryLazy", dependencies = {{'nvim-tree/nvim-web-devicons', opts = {}}}},
  {'stevearc/oil.nvim', event = "VeryLazy", opts = {}},

  -- Git related plugins
  {'tpope/vim-fugitive', event = "VeryLazy"},
  {'junegunn/gv.vim', event = "VeryLazy"}, --commit browser

  -- Search and replace
  {'ray-x/sad.nvim', opts = {}, event = "VeryLazy", dependencies = {
    {'ray-x/guihua.lua', build = 'cd lua/fzy && make' }
  }},

  -- General Utility
  'nvim-lua/plenary.nvim', -- general lua functions, dependency for many plugins
  { 'folke/which-key.nvim', opts = {} },
  {'chentoast/marks.nvim', opts = {}},
  {'numToStr/Comment.nvim', event = "VeryLazy", opts = {}},
  {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},
  {'simeji/winresizer', event = "VeryLazy"},
  'mbbill/undotree',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- REPL
  {'hkupty/iron.nvim', event = "VeryLazy"},

  -- Debugger
  {'rcarriga/nvim-dap-ui', event = "VeryLazy", opts = {}, dependencies = {'mfussenegger/nvim-dap'}},

}
