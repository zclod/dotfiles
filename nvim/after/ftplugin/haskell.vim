"haskell enabled linters
let g:neomake_haskell_enabled_makers = ["hdevtools", "hlint"]

"autocompletion function
setlocal omnifunc=necoghc#omnifunc

"##############################################################
"keybinding
"
"type information
nnoremap <buffer> <Localleader>ht :HdevtoolsType<CR>
nnoremap <buffer> <Localleader>hT :HdevtoolsInfo<CR>

"clear type highlight
nnoremap <buffer> <Localleader>sc :HdevtoolsClear<CR>

"REPL
"open repl session
nnoremap <buffer> <Localleader>cc :call SlimeRepl("cabal repl")<CR>
"send line or selection to normal slime
nnoremap <buffer> <silent> <Localleader>l :SlimeSend<CR>
vnoremap <buffer> <silent> <Localleader>l :SlimeSend<CR>
"send line or selection to haskell script mode slime
nnoremap <buffer> <silent> <Localleader>, :set ft=haskell.script<CR> <bar> :SlimeSend<CR> <bar> :set ft=haskell<CR>
"C-U to ignore selection during 'set' command
vnoremap <buffer> <silent> <Localleader>, :<C-U>set ft=haskell.script<CR> <bar> :'<,'>SlimeSend<CR> <bar> :<C-U>set ft=haskell<CR>
"##############################################################
