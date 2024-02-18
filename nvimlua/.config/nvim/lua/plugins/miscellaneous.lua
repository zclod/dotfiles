return {

  -- General Utility
  'nvim-lua/plenary.nvim', -- general lua functions, dependency for many plugins
  'mbbill/undotree',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},

  { 'folke/which-key.nvim', event = "VeryLazy", opts = {} },
  {'chentoast/marks.nvim', event = "VeryLazy", opts = {}},
  {'numToStr/Comment.nvim', event = "VeryLazy", opts = {}},

}
