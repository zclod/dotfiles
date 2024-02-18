local map = require('utils').map

map("i", "jk", "<esc>")
map("i", "kj", "<esc>")

-- terminal esc
map("t", "<esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")

-- No ex mode
map("n", "Q", "<nop>")

map("n", "*", "*N")

map({"n", "o", "x"}, "<", "[", {remap = true})
map({"n", "o", "x"}, ">", "]", {remap = true})

-- # to go back to previous buffer
map("n", '<Leader><Tab>', '<cmd>buffer #<cr>', { desc = "reopen previous buffer"})

-- Keymaps for better default experience
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "C-q", "<cmd>copen<cr>")
----------------------------------------------------------------------
--# b    -Buffers
map("n", "<Leader>bd", '<cmd>bdelete<cr>', { desc = "[d]elete current buffer"})
map("n", "<Leader>bD", '<cmd>w \\| %bd \\| e#<cr>', { desc = "[D]elete all other buffers" })
map("n", "<Leader>bfd", '<cmd>bdelete!<cr>', { desc = "[f]orce [d]elete current buffer" })

----------------------------------------------------------------------
--# c    -Configuration
map("n", "<Leader>co", '<cmd>e ~/.config/nvim/init.lua<cr>', {desc = "[c]onfiguration [o]pen"})

----------------------------------------------------------------------
--# d Diagnostic
map('n', '<leader>dN', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map('n', '<leader>de', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

----------------------------------------------------------------------
--# f    -Files
map("n", "<Leader>fs", '<cmd>w<cr>', { desc = "[f]ile [s]ave" })
map("n", "<Leader>fS", '<cmd>wa<cr>', { desc = "[S]ave all open files" })

----------------------------------------------------------------------
--# g    -Git

----------------------------------------------------------------------
--# h    -Help
--
----------------------------------------------------------------------
--# q    -Quit
map("n", "<Leader>qq", '<cmd>qa<cr>', { desc = "[q]uit" })
-- force close all
map("n", "<Leader>qQ", '<cmd>qa!<cr>', { desc = "force [Q]uit for all files" })
-- save and close all
map("n", "<Leader>qs", '<cmd>xa<cr>', { desc = "[q]uit and [s]ave all" })

----------------------------------------------------------------------
--# s    -Search

----------------------------------------------------------------------

--# w    -Window
map("n", "<Leader>wd", '<C-w>c', { desc = "[w]indow [d]elete current" })
map("n", "<Leader>wf", '<cmd>only<cr>', { desc = "[w]indow [f]ull screen" })
map("n", "<Leader>wh", '<cmd>split<cr>', { desc = "[w]indow split [h]orizontal" })
map("n", "<Leader>wv", '<cmd>vsplit<cr>', { desc = "[w]indow split [v]ertical" })
-- move left
map("n", "<left>", '<C-w>h')
-- move down
map("n", "<down>", '<C-w>j')
-- move up
map("n", "<up>", '<C-w>k')
-- move right
map("n", "<right>", '<C-w>l')


----------------------------------------------------------------------
-- LSP Settings
--
--  This function gets run when an LSP connects to a particular buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
    local bufnr = ev.buf
    
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<localleader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<localleader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<localleader>td', vim.lsp.buf.type_definition, '[T]ype [D]efinition')
    -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<localleader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<localleader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<localleader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end,
})
