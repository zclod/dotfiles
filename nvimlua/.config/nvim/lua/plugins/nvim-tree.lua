return {
  {
    'nvim-tree/nvim-tree.lua',

    opts = {},

    dependencies = {{'nvim-tree/nvim-web-devicons', opts = {}}},

    keys = {
      {"<Leader>ft", mode = {"n"}, '<cmd>NvimTreeToggle<cr>', desc = "[f]ile [t]ree toggle"},
    },
  },
}
