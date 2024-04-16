return {

  {
    'stevearc/oil.nvim',

    lazy = false,

    opts = {},

    keys = {
      { "<Leader>fe", mode = { "n" }, function() require("oil").open('.') end, desc = "[f]ile [e]xplorer" },
      { "-", mode = { "n" }, function() require("oil").open() end, desc = "Open parent directory of current file" },
    }
  },
}
