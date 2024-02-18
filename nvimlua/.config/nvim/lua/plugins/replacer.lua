return {
  {
    'gabrielpoca/replacer.nvim',
    keys = {
        {
            '<leader>rr',
            function() require('replacer').run({rename_files = false}) end,
            desc = "run replacer"
        },
        {
            '<leader>rR',
            function() require('replacer').run({rename_files = true}) end,
            desc = "run replacer including filenames"
        },
    }
  }
}
