return {
  {
    'ggandor/leap.nvim', 

    opts = {
      safe_labels = {"d", "f", "g", "l", "k", "j", "h", "a", "s", "t", "y", "r", "u", "e", "i", "w", "o"},
      labels = {"d", "f", "g", "l", "k", "j", "h", "a", "s", "t", "y", "r", "u", "e", "i", "w", "o", "p", "q", "z", "m", "x", "n", "c", "b", "v" },
    },

    config = function(_, opts) 
      require('leap').setup(opts)
      require('leap').add_default_mappings()
    end,
  },
}
