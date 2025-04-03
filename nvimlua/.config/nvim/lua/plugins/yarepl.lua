return {
    'milanglacier/yarepl.nvim',
    event = 'VeryLazy',

    -- opts = {
    --     metas = { aider = function()
    --                 return require('yarepl.extensions.aider').create_aider_meta()
    --               end,
    --     },
    -- },
    
    config = function()
        -- necessario fare cosi per utilizzare le estensioni
        require('yarepl').setup({
            metas = { aider = require('yarepl.extensions.aider').create_aider_meta() },
        })
    end,


    keys ={
      {"<F1>", mode = {"n"}, '<Plug>(REPLHideOrFocus)'},
      {"<Leader>rb", mode = {"n"}, function() require('yarepl.extensions.fzf').repl_show() end, desc = "search active repl [b]uffers"},
      {"<Leader>rs", mode = {"n"}, '<Plug>(REPLStart)', desc = "[s]tart a repl for the current buffer"},
      {"<Leader>ra", mode = {"n"}, '<cmd>REPLAttachBufferToREPL<cr>', desc = "[a]ttach buffer to repl"},
      {"<Leader>rd", mode = {"n"}, '<cmd>REPLDetachBufferToREPL<cr>', desc = "[d]etach buffer to repl"},
      {"<Leader>rc", mode = {"n"}, '<Plug>(REPLClose)', desc = "[c]lose repl"},
      {"<Leader>rl", mode = {"n"}, '<Plug>(REPLSendLine)', desc = "send current [l]ine to repl"},
      {"<Leader>rv", mode = {"v"}, '<Plug>(REPLSendVisual)', desc = "send [v]isual selection to repl"},
      {"<Leader>re", mode = {"n"}, '<Plug>(REPLExec)', desc = "[e]xec command in repl"},
      {"<Leader>rt", mode = {"n"}, '<cmd>REPLStart bash<cr>', desc = "start a [t]erminal repl for the current buffer"},

      {"<Leader>aa", mode = {"n"}, '<cmd>REPLStart aider<cr>', desc = "start [a]ider repl"},
      {"<Leader>ae", mode = {"n"}, '<Plug>(AiderExec)', desc = "Type the prompt in cmdline and send it to aider"},
      {"<Leader>ay", mode = {"n"}, '<Plug>(AiderSendYes)', desc = "send [y]es to aider"},
      {"<Leader>an", mode = {"n"}, '<Plug>(AiderSendNo)', desc = "send [n]o to aider"},
      {"<Leader>ap", mode = {"n"}, '<Plug>(AiderSendPaste)', desc = "send [p]aste command to aider"},
      {"<Leader>al", mode = {"n"}, '<Plug>(REPLSendLine-aider)', desc = "send current [l]ine to aider"},
      {"<Leader>av", mode = {"v"}, '<Plug>(REPLSendVisual-aider)', desc = "send [v]isual selection to aider"},
      {"<Leader>ac", mode = {"n"}, '<Plug>(AiderSendExit)', desc = "[c]lose aider"},
    },
}
