return {
  {
    -- better quickfix
    'ten3roberts/qf.nvim',

    opts = {},

    keys ={
      {"<C-l>", mode = {"n"}, function() require('qf').toggle('l') end, desc = "toggle location list"},
      {"<C-q>", mode = {"n"}, function() require('qf').toggle('c') end, desc = "toggle quickfix"},
    },

  },
}
