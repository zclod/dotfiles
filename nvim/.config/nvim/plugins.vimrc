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

Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/sad.nvim'
Plug 'rktjmp/highlight-current-n.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs' " parents balancer
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'chentoast/marks.nvim'

Plug 'simeji/winresizer'

Plug 'junegunn/limelight.vim' " highlight editing scope

Plug 'easymotion/vim-easymotion'
Plug 'ggandor/leap.nvim'
"----------------------------------------------------------------

"Version control-------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
"----------------------------------------------------------------

"Completion------------------------------------------------------
Plug 'ervandew/supertab'     " tab completion

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hkupty/iron.nvim'

Plug 'SirVer/ultisnips'      " snippets framework
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

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
let g:winresizer_start_key = '<C-w>'
"-------------------------------------------------------------
"Highlight current n
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

lua require("oil").setup()

lua require("sad").setup()

lua require("marks").setup()

"-------------------------------------------------------------
" Luatree

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
