return {
  {
    'ggandor/leap.nvim', 
    config = function(_, opts) 
      require('leap').add_default_mappings()
    end,
  },
}
