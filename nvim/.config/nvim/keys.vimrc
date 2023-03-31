
"  _  __         _    _         _ _
" | |/ /___ _  _| |__(_)_ _  __| (_)_ _  __ _ ___
" | ' </ -_) || | '_ \ | ' \/ _` | | ' \/ _` (_-<
" |_|\_\___|\_, |_.__/_|_||_\__,_|_|_||_\__, /__/
"           |__/                        |___/
"


" Leader key
let mapleader="\<SPACE>"
let maplocalleader = ","

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
nnoremap <Leader>bD :w \| %bd \| e#<CR>
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
nnoremap <Leader>sp :FzfLua live_grep<CR>
" search and replace
nnoremap <Leader>sr :Sad<CR>
"----------------------------------------------------------------------

"# w    -Window
" close window
nnoremap <Leader>wD <C-w>c
" close other windows
nnoremap <Leader>wd :only<CR>
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
nmap f <Plug>(leap-forward-to)
nmap F <Plug>(leap-backward-to)
