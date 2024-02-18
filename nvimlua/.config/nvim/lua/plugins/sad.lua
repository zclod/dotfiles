return {

  -- Search and replace
  {
    'ray-x/sad.nvim',

    opts = {},

    dependencies = {
      {'ray-x/guihua.lua', build = 'cd lua/fzy && make' }
    },

    keys = {
      {"<Leader>sr", mode = {"n"}, '<cmd>Sad<cr>', desc = "[s]earch and [r]eplace"},
    },
  },

}
