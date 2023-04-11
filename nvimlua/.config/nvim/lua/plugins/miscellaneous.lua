return {
--  External Dependencies:
--    fzf
--    ripgrep
--    sad
--      fd
--      delta
--    nerdfonts (for web-dev-icons)

  'nvim-lua/plenary.nvim',

  -- Fuzzy Finder (files, lsp, etc)
  {'ibhagwan/fzf-lua', config = function() require("fzf-lua").register_ui_select() end},

  -- File explorer
  {'nvim-tree/nvim-tree.lua', opts = {}, dependencies = {{'nvim-tree/nvim-web-devicons', opts = {}}}},
  {'stevearc/oil.nvim', opts = {}},

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- Search and replace
  {'ray-x/sad.nvim', opts = {}, dependencies = {
    {'ray-x/guihua.lua', build = 'cd lua/fzy && make' }
  }},

  'simeji/winresizer',
  { 'numToStr/Comment.nvim', opts = {} },
  'mbbill/undotree',
  'tpope/vim-repeat',
  'jose-elias-alvarez/null-ls.nvim',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'jiangmiao/auto-pairs',
  'chentoast/marks.nvim',

  -- REPL
  'hkupty/iron.nvim',

}
