"  ___ _           _
" | _ \ |_  _ __ _(_)_ _  ___
" |  _/ | || / _` | | ' \(_-<
" |_| |_|\_,_\__, |_|_||_/__/
"            |___/
"
" Dependencies:
"   fzf
"   ripgrep
"   sad
"     fd
"     delta
"   nerdfonts (for web-dev-icons)



" auto-install vim-plug
if empty(glob(g:config_root.'autoload/plug.vim'))
  silent exec "!curl -fLo" g:config_root.'autoload/plug.vim' "--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(g:config_root.'plugged')

"Look and feel---------------------------------------------------

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-tree/nvim-web-devicons'

"Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'EdenEast/nightfox.nvim'
"----------------------------------------------------------------

"Utilities-------------------------------------------------------
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

Plug 'nvim-tree/nvim-tree.lua'
Plug 'stevearc/oil.nvim'

Plug 'nvim-lua/plenary.nvim'

Plug 'easymotion/vim-easymotion'

" Search and replace
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/sad.nvim'
Plug 'rktjmp/highlight-current-n.nvim'

" REPL
Plug 'hkupty/iron.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs' " parents balancer
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'chentoast/marks.nvim'
Plug 'simeji/winresizer'
Plug 'junegunn/limelight.vim' " highlight editing scope

"Version control-------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'lewis6991/gitsigns.nvim'

"Completion------------------------------------------------------
" Plug 'ervandew/supertab'     " tab completion

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'SirVer/ultisnips'      " snippets framework
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

"Language servers------------------------------------------------

" manage language servers
" Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
" Plug 'williamboman/mason-lspconfig.nvim'

" Java
Plug 'mfussenegger/nvim-jdtls'

"----------------------------------------------------------------

call plug#end()


"###############################################################

"   ___           __ _                    _   _
"  / __|___ _ _  / _(_)__ _ _  _ _ _ __ _| |_(_)___ _ _
" | (__/ _ \ ' \|  _| / _` | || | '_/ _` |  _| / _ \ ' \
"  \___\___/_||_|_| |_\__, |\_,_|_| \__,_|\__|_\___/_||_|
"                     |___/

"###############################################################

"-------------------------------------------------------------
" lua standard plugin attivations

lua require("oil").setup()

lua require("sad").setup()
" alternative that do not requires delta and fd
" lua require("sad").setup(diff='less', ls_file='git ls-files')

lua require("marks").setup()

lua require("gitsigns").setup()

lua require("nvim-web-devicons").setup()

" lua require("mason").setup()
" lua require("mason-lspconfig").setup()

" lua require("lspconfig").jdtls.setup{}
"-------------------------------------------------------------
" fzf-lua
lua require("fzf-lua").register_ui_select()
"-------------------------------------------------------------
"vim-commentary
autocmd FileType nix setlocal commentstring=#\ %s

"-------------------------------------------------------------
"easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcbnmvfj'

"-------------------------------------------------------------
"Fugitive
"delete older fugitive created buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"-------------------------------------------------------------
"Limelight
"
"Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"-------------------------------------------------------------
"Window resizer
let g:winresizer_start_key = '<C-w><C-r>'
"-------------------------------------------------------------
"Highlight current n
"
" Map keys
nmap n <Plug>(highlight-current-n-n)
nmap N <Plug>(highlight-current-n-N)

" If you want the highlighting to take effect in other maps they must
" also be nmaps (or rather, not "nore").
"
" * will search <cword> ahead, but it can be more ergonomic to have *
" simply fill the / register with the current <cword>, which makes future
" commands like cgn "feel better". This effectively does that by performing
" "search ahead <cword> (*), go back to last match (N)".
nmap * *N

" Some QOL autocommands
augroup ClearSearchHL
  autocmd!
  " You may only want to see hlsearch /while/ searching, you can automatically
  " toggle hlsearch with the following autocommands
  autocmd CmdlineEnter /,\? set hlsearch
  autocmd CmdlineLeave /,\? set nohlsearch
  " this will apply similar n|N highlighting to the first search result
  " careful with escaping ? in lua, you may need \\?
  autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
augroup END

"-------------------------------------------------------------
" nvim-cmp configuration

lua <<EOF
-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({

  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {i, c}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },

  sources = {
      { name = 'nvim_lsp', max_item_count = 15},
      { name = 'nvim_lsp_signature_help' },
      { name = 'ultisnips' }, -- For ultisnips users.
      { name = 'nvim_lsp_lua' },
      { name = 'buffer', keyword_length = 4, max_item_count = 10 },
  },

  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

  --formatting = {
  --  format = lspkind.cmp_format {
  --    mode = "text_symbol",
  --    menu = ({
  --    buffer = "[buf]",
  --    nvim_lsp = "[LSP]",
  --    path = "[path]",
  --    ultisnips = "[path]",
  --    }),
  --  },
  --},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline', option = {ignore_cdms = {'Man', '!', 'FzfLua'}}},
  })
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }
EOF

"-------------------------------------------------------------
" Luatree

lua <<EOF
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
EOF
