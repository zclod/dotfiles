
"  _  __         _    _         _ _
" | |/ /___ _  _| |__(_)_ _  __| (_)_ _  __ _ ___
" | ' </ -_) || | '_ \ | ' \/ _` | | ' \/ _` (_-<
" |_|\_\___|\_, |_.__/_|_||_\__,_|_|_||_\__, /__/
"           |__/                        |___/
"


" Leader key
let mapleader="\<SPACE>"

" Esc remap
inoremap jk <esc>
inoremap kj <esc>

" Terminal esc remap
tnoremap <Esc> <C-\><C-n>

" no ex mode
nnoremap Q <nop>

" Common spacemacs keybindings #########################################

" commands fuzzy finder
nnoremap <Leader><Leader> :Commands<CR>

" comment visual mode
vnoremap <Leader>; :Commentary<CR>

"# a
nmap <Leader>al <Plug>(EasyAlign)
xmap <Leader>al <Plug>(EasyAlign)
"----------------------------------------------------------------------

"# b    -Buffers
" list buffer
nnoremap <Leader>bb :Buffers<CR>
" delete current buffer
nnoremap <Leader>bd :bdelete<CR>
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
nnoremap <Leader>ws :split<CR>
" split vertical
nnoremap <Leader>wv :vsplit<CR>
" move right
nnoremap <Leader>wh <C-w>h
" move down
nnoremap <Leader>wj <C-w>j
" move up
nnoremap <Leader>wk <C-w>k
" move left
nnoremap <Leader>wl <C-w>l
"######################################################################
