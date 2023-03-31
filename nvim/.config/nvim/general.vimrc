"   ___                       _
"  / __|___ _ _  ___ _ _ __ _| |
" | (_ / -_) ' \/ -_) '_/ _` | |
"  \___\___|_||_\___|_| \__,_|_|
"
"

"usa la clipboard di sistema (richiede xclip installato)
set clipboard+=unnamedplus

set list                " Show invisible characters
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

"Theming-----------------------------------------------------------------------
colorscheme solarized8_dark_high

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
"------------------------------------------------------------------------------
