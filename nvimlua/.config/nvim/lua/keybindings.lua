local map = require('utils').map
local fzf = require('fzf-lua')
local oil = require('oil')

map("i", "jk", "<esc>")
map("i", "kj", "<esc>")

-- terminal esc
map("t", "<esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")

-- No ex mode
map("n", "Q", "<nop>")

map({"n", "o", "x"}, "<", "[", {remap = true})
map({"n", "o", "x"}, ">", "]", {remap = true})

map("v", "s", "S", {remap = true})

map("n", "<M-x>", fzf.commands)

map("n", '<Leader><Tab>', '<cmd>buffer #<cr>')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

----------------------------------------------------------------------

--# b    -Buffers
-- list buffer
map("n", "<Leader>bb", fzf.buffers)
-- delete current buffer
map("n", "<Leader>bd", '<cmd>bdelete<cr>')
-- delete other buffers
map("n", "<Leader>bD", '<cmd>w \\| %bd \\| e#<cr>')
-- force delete current buffers
map("n", "<Leader>bfd", '<cmd>bdelete!<cr>')
----------------------------------------------------------------------

--# c    -Configuration

map("n", "<Leader>cc", fzf.colorschemes)
----------------------------------------------------------------------

--# d Diagnostic
map('n', '<leader>dN', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map('n', '<leader>de', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
----------------------------------------------------------------------

--# f    -Files
-- file save
map("n", "<Leader>fs", '<cmd>w<cr>')
-- save all open files
map("n", "<Leader>fS", '<cmd>wa<cr>')
-- open file explorer
map("n", "<Leader>fe", function () oil.open('.') end)
--nnoremap <Leader>fp :Oil 
map("n", "<Leader>fp", '<cmd>Oil')
-- toggle file tree
map("n", "<Leader>ft", '<cmd>NvimTreeToggle<cr>')

map("n", "<Leader>ff", fzf.files)
map("n", "<Leader>fg", fzf.git_files)

-- open file parent directory with oil -
map("n", "-", oil.open, { desc = "Open parent directory" })
----------------------------------------------------------------------

--# g    -Git
map("n", "<Leader>gs", '<cmd>Git<cr>', { desc = "[G]it [S]tatus" })
map("n", "<Leader>gl", '<cmd>GV<cr>', { desc = "[G]it [L]ogs" })

----------------------------------------------------------------------
--# h    -Help
map("n", "<Leader>hh", fzf.help_tags)
----------------------------------------------------------------------
--# q    -Quit
map("n", "<Leader>qq", '<cmd>qa<cr>')
-- force close all
map("n", "<Leader>qQ", '<cmd>qa!<cr>')
-- save and close all
map("n", "<Leader>qs", '<cmd>xa<cr>')

----------------------------------------------------------------------

--# s    -Search
map("n", "<Leader>ss", fzf.lgrep_curbuf)
map("n", "<Leader>sl", fzf.blines)
map("n", "<Leader>sp", fzf.live_grep_glob)
-- search and replace
map("n", "<Leader>sr", '<cmd>Sad<cr>')

----------------------------------------------------------------------

--# w    -Window
-- close window (window delete)
map("n", "<Leader>wd", '<C-w>c')
-- close other windows (window full)
map("n", "<Leader>wf", '<cmd>only<cr>')
-- split horizontal
map("n", "<Leader>w-", '<cmd>split<cr>')
-- split vertical
map("n", "<Leader>w/", '<cmd>vsplit<cr>')
-- move left
map("n", "<left>", '<C-w>h')
-- move down
map("n", "<down>", '<C-w>j')
-- move up
map("n", "<up>", '<C-w>k')
-- move right
map("n", "<right>", '<C-w>l')

map("n", "<Leader>wr", '<cmd>WinResizerStartResize<cr>')
map("n", "<Leader>wm", '<cmd>WinResizerStartMove<cr>')


----------------------------------------------------------------------
-- LSP Settings
--
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
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
  nmap('<localleader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
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
end
