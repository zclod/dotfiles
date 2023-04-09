return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {style = 'cool'},
    config = function(_, opts)
      vim.cmd.colorscheme 'tokyonight'
    end,
  },


  'neanias/everforest-nvim',
  'shaunsingh/moonlight.nvim',
  'shaunsingh/nord.nvim',

  --Solarized
  'romainl/flattened',

}
