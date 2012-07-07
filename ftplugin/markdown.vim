setlocal autoindent
setlocal formatoptions=tcroqn2
setlocal comments=n:>
setlocal tw=78
" this is python specific stuff - gets loaded on filetype detection

map! <F5> <Esc>:w<CR>:!md_preview.py % <CR>
map  <F5> <Esc>:w<CR>:!md_preview.py % <CR>

