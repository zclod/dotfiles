
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

"search under cursor without move to next occurrence
nnoremap * *N
nnoremap # #N

"use vim surround with "s" in visual mode
vmap s S

" Common spacemacs keybindings #########################################

" commands fuzzy finder
nnoremap <M-x> :Commands<CR>

" comment visual mode
vnoremap <Leader>; :Commentary<CR>

" go to last used buffer
nnoremap <Leader><tab> :buffer #<CR>


"# a
nmap <Leader>al <Plug>(EasyAlign)
xmap <Leader>al <Plug>(EasyAlign)
"----------------------------------------------------------------------

"# b    -Buffers
" list buffer
nnoremap <Leader>bb :Buffers<CR>
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
nnoremap <Leader>fe :Explore<CR>
"----------------------------------------------------------------------

"# g    -Git
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :GV<CR>
"----------------------------------------------------------------------

"# h    -Help
nnoremap <Leader>hh :help<space>
"----------------------------------------------------------------------

"# j    -Jump
" file outline
nnoremap <Leader>js :TagbarOpenAutoClose<CR>
"----------------------------------------------------------------------

"# p    -Project
" search file in current git repo (project)
nnoremap <Leader>pf :GFiles<CR>
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
nnoremap <Leader>ss :AckWindow<space>
"----------------------------------------------------------------------

"# w    -Window
" close window
nnoremap <Leader>wd <C-w>c
" close other windows
nnoremap <Leader>wm :only<CR>
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
"######################################################################
"
"Easymotion
nmap s <Plug>(easymotion-overwin-f)

"LanguageClient
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
