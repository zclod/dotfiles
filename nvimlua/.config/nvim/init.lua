require('general')
--
--
-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({

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


  {'ray-x/sad.nvim', opts = {}, dependencies = {
    {'ray-x/guihua.lua', build = 'cd lua/fzy && make' }
  }},

  'simeji/winresizer',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'jiangmiao/auto-pairs',
  'chentoast/marks.nvim',
  { 'numToStr/Comment.nvim', opts = {} },
  'mbbill/undotree',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  'jose-elias-alvarez/null-ls.nvim',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  'hkupty/iron.nvim',

  { import = 'plugins' },
}, {})

require('keybindings')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
