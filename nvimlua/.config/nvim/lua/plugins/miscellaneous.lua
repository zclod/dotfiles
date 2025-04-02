return {

  -- General Utility
  'nvim-lua/plenary.nvim', -- general lua functions, dependency for many plugins
  {'mbbill/undotree', 
    keys = {
      {"<F2>", mode = {"n"}, '<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>'},
    },
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {'windwp/nvim-autopairs', event = "InsertEnter", opts = {}},

  { 'folke/which-key.nvim', event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>f", group = "file" },
        { "<leader>b", group = "buffer" },
        { "<leader>s", group = "search" },
        { "<leader>w", group = "window" },
        { "<leader>r", group = "REPL" },
        { "<leader>h", group = "help" },
        { "<leader>q", group = "quit" },
        { "<leader>c", group = "configuration" },
        { "<leader>d", group = "diagnostic" },
        { "<leader>a", group = "AI" },
      },
    },
  },

  {'chentoast/marks.nvim', event = "VeryLazy", opts = {}},
  {'numToStr/Comment.nvim', event = "VeryLazy", opts = {}},

}
