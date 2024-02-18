return {
--  External Dependencies:
--    fzf
--    ripgrep
--
--
--
--    sad
--      fd
--      delta
--    nerdfonts (for web-dev-icons)

  -- Fuzzy Finder (files, lsp, etc)
  {
    'ibhagwan/fzf-lua',

    config = function() require("fzf-lua").register_ui_select() end,

    keys = {
      {"<M-x>", mode = {"n"}, function() require('fzf-lua').commands() end},
      {"<Leader>bb", mode = {"n"}, function() require('fzf-lua').buffers() end, desc = "list [b]uffers"},

      {"<Leader>cc", mode = {"n"}, function() require('fzf-lua').colorschemes() end, desc = "[c]hance [c]olorscheme"},

      {"<Leader>ff", mode = {"n"}, function() require('fzf-lua').files() end, desc = "[f]ind [f]iles"},
      {"<Leader>fg", mode = {"n"}, function() require('fzf-lua').git_files() end, desc = "[f]ind [g]it files"},

      {"<Leader>hh", mode = {"n"}, function() require('fzf-lua').help_tags() end, desc = "search [h]ealp"},

      {"<Leader>ss", mode = {"n"}, function() require('fzf-lua').lgrep_curbuf() end, desc = "[s]earch with grep in current buffer"},
      {"<Leader>sb", mode = {"n"}, function() require('fzf-lua').blines() end, desc = "fuzzy find in lines of [b]uffer"},
      {"<Leader>sB", mode = {"n"}, function() require('fzf-lua').lines() end, desc = "fuzzy find in lines from all [B]uffers"},
      {"<Leader>sp", mode = {"n"}, function() require('fzf-lua').live_grep_glob() end, desc = "[s]earch [p]roject (glob enabled)"},
      {"<Leader>sw", mode = {"n"}, function() require('fzf-lua').grep_cword() end, desc = "[s]earch c[w]ord under cursor"},
      {"<Leader>sW", mode = {"n"}, function() require('fzf-lua').grep_cWORD() end, desc = "[s]earch c[W]ORD under cursor"},

      {"<Leader>sq", mode = {"n"}, function() require('fzf-lua').quickfix() end, desc = "[s]earch in [q]uickfix window"},
      {"<Leader>sQ", mode = {"n"}, function() require('fzf-lua').quickfix_stack() end, desc = "[s]earch in [Q]uickfix stack"},
      {"<Leader>sl", mode = {"n"}, function() require('fzf-lua').loclist() end, desc = "[s]earch in [l]loclist window"},
      {"<Leader>sL", mode = {"n"}, function() require('fzf-lua').loclist_stack() end, desc = "[s]earch in [L]oclist stack"},

      {"<Leader>sm", mode = {"n"}, function() require('fzf-lua').marks() end, desc = "[s]earch [m]arks"},
    }
  },

}
