"   ___                       _ 
"  / __|___ _ _  ___ _ _ __ _| |
" | (_ / -_) ' \/ -_) '_/ _` | |
"  \___\___|_||_\___|_| \__,_|_|
"                               
"

"usa la clipboard di sistema (richiede xclip installato)
set clipboard+=unnamedplus


"Theming-----------------------------------------------------------------------
colorscheme solarized
set background=dark

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
