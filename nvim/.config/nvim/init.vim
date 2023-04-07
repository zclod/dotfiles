let g:config_root = "~/.config/nvim/"

" Leader key
let mapleader="\<SPACE>"
let maplocalleader = ","

"Disable netrw
lua <<EOF
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
EOF

runtime plugins.vimrc
runtime general.vimrc
runtime keys.vimrc
