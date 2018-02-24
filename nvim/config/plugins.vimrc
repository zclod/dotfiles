"  ___ _           _
" | _ \ |_  _ __ _(_)_ _  ___
" |  _/ | || / _` | | ' \(_-<
" |_| |_|\_,_\__, |_|_||_/__/
"            |___/
"
" Dependencies:
"   fzf
"   ag
"   ctags (for tagbar)



" auto-install vim-plug
if empty(glob(g:config_root.'autoload/plug.vim'))
  silent exec "!curl -fLo" g:config_root.'autoload/plug.vim' "--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(g:config_root.'plugged')

"Look and feel---------------------------------------------------

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
"----------------------------------------------------------------

"Utilities-------------------------------------------------------

Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " completion framework
Plug 'SirVer/ultisnips'      " snippets framework
Plug 'ervandew/supertab'     " tab completion
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs' " parents balancer
Plug 'terryma/vim-expand-region'
Plug 'junegunn/limelight.vim' " highlight editing scope
Plug 'junegunn/vim-easy-align'
Plug 'jpalardy/vim-slime'  "repl integration
Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
Plug 'mbbill/undotree'
Plug 'simeji/winresizer'

"fzf fuzzy finder install
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
"----------------------------------------------------------------

"Version control-------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'      " Sweet message committer
"----------------------------------------------------------------

"Languages-------------------------------------------------------

Plug 'autozimu/LanguageClient-neovim', {
                                        \ 'branch' : 'next',
                                        \ 'do': 'bash install.sh'
                                        \ }

"Haskell
Plug 'neovimhaskell/haskell-vim',     {'for': 'haskell'}
" Plug 'bitc/vim-hdevtools',            {'for': 'haskell'}
" Plug 'eagletmt/neco-ghc',             {'for': 'haskell'}
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
"Ack
"use silver searcher with the ack plugin
let g:ackprg = 'ag --vimgrep'
let g:ackpreview = 1

"-------------------------------------------------------------
"Fugitive
"delete older fugitive created buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"-------------------------------------------------------------
" Deoplete
let g:deoplete#enable_at_startup = 1
"C-space to open completion suggestion
if has("gui_running")
    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
else
    inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
endif

"-------------------------------------------------------------
" Language Server Protocol
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp']
    \ }
let g:LanguageClient_autoStart = 1
set formatexpr=LanguageClient_textDocument_rangeFormatting()

"-------------------------------------------------------------
"Limelight
"
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"-------------------------------------------------------------
"Slime
let g:slime_target = "neovim"
"smart function to start a slime repl
function! SlimeRepl(repl)
  let currentfile = expand('%:p')
  let cursorpos = getpos(".")
  call termopen(a:repl)
  let termid = b:terminal_job_id
  vnew
  execute "edit " . fnameescape(currentfile)
  call setpos(".", cursorpos)
  let b:slime_config={'jobid':termid}
endfunction
