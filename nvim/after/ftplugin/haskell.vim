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
"##############################################################
