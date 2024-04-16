return {
  {
    'glacambre/firenvim',
  
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,

    cond = not not vim.g.started_by_firenvim,
 
    build = function()
        vim.fn["firenvim#install"](0)
    end,

  -- configure FireNvim here:
  config = function()
    vim.g.firenvim_config = {
      -- config values, like in my case:
      localSettings = {
        [".*"] = {
          takeover = "never",
        },
      },
    }
  end,

  }
}
