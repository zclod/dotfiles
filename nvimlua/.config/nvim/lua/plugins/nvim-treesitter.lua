return {
  {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    event = "VeryLazy",

    enabled = false,

  },
}
