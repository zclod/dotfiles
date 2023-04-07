
"  _  __         _    _         _ _
" | |/ /___ _  _| |__(_)_ _  __| (_)_ _  __ _ ___
" | ' </ -_) || | '_ \ | ' \/ _` | | ' \/ _` (_-<
" |_|\_\___|\_, |_.__/_|_||_\__,_|_|_||_\__, /__/
"           |__/                        |___/
"

" Esc remap
inoremap jk <esc>
inoremap kj <esc>

" Terminal esc remap
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>

" no ex mode
nnoremap Q <nop>

"use vim surround with "s" in visual mode
vmap s S

" Common spacemacs keybindings #########################################

" commands fuzzy finder
nnoremap <M-x> :FzfLua commands<CR>

" comment visual mode
vnoremap <Leader>; :Commentary<CR>

" go to last used buffer
nnoremap <Leader><tab> :buffer #<CR>


"# a
nmap <Leader>al <Plug>(EasyAlign)
xmap <Leader>al <Plug>(EasyAlign)
" apparence colorscheme
nnoremap <Leader>ac :FzfLua colorschemes<CR>
"----------------------------------------------------------------------

"# b    -Buffers
" list buffer
nnoremap <Leader>bb :FzfLua buffers<CR>
" delete current buffer
nnoremap <Leader>bd :bdelete<CR>
" delete other buffers
nnoremap <Leader>bDo :w \| %bd \| e#<CR>
" force delete current buffers
nnoremap <Leader>bDc :bdelete!<CR>
"----------------------------------------------------------------------

"# c    -Configuration
"reload config
nnoremap <leader>cr :source $MYVIMRC<CR>
"----------------------------------------------------------------------

"# f    -Files
" file save
nnoremap <Leader>fs :w<CR>
" save all open files
nnoremap <Leader>fS :wa<CR>
" open file explorer
nnoremap <Leader>fe :Oil .<CR>
nnoremap <Leader>fp :Oil 
" toggle file tree
nnoremap <Leader>ft :NvimTreeToggle<CR>

nnoremap <Leader>ff :FzfLua files<CR>
nnoremap <Leader>fp :FzfLua git_files<CR>

" open file parent directory with oil -
lua vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

"----------------------------------------------------------------------

"# g    -Git
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gl :GV<CR>
"----------------------------------------------------------------------

"# h    -Help
nnoremap <Leader>hh :help<space>
"----------------------------------------------------------------------

"# j    -Jump
"----------------------------------------------------------------------

"# p    -Project
"----------------------------------------------------------------------

"# q    -Quit
nnoremap <Leader>qq :qa<CR>
" force close all
nnoremap <Leader>qQ :qa!<CR>
" save and close all
nnoremap <Leader>qs :xa<CR>
"----------------------------------------------------------------------

"# s    -Search
" clear highlights
nnoremap <Leader>sc :noh<CR>
nnoremap <Leader>ss :FzfLua lgrep_curbuf<CR>
nnoremap <Leader>sl :FzfLua blines<CR>
nnoremap <Leader>sp :FzfLua live_grep_glob<CR>
" search and replace
nnoremap <Leader>sr :Sad<CR>
"----------------------------------------------------------------------

"# w    -Window
" close window (window delete)
nnoremap <Leader>wd <C-w>c
" close other windows (window full)
nnoremap <Leader>wf :only<CR>
" split horizontal
nnoremap <Leader>w- :split<CR>
" split vertical
nnoremap <Leader>w/ :vsplit<CR>
" move left
nnoremap <left> <C-w>h
" move down
nnoremap <down> <C-w>j
" move up
nnoremap <up> <C-w>k
" move right
nnoremap <right> <C-w>l

nnoremap <Leader>wr :WinResizerStartResize<CR>
nnoremap <Leader>wm :WinResizerStartMove<CR>
"######################################################################
"
"Easymotion
nmap s <Plug>(easymotion-overwin-f)

"----------------------------------------------------------------------
"Language server protocol

lua <<EOF

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<localleader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<localleader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<localleader>dN', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<localleader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<localleader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<localleader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<localleader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<localleader>td', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<localleader>sr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<localleader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

EOF
