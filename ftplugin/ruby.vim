" this is python specific stuff - gets loaded on filetype detection

" make is always F4 in Tom's vimrc
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab

"automatic return when inserting beyond 80th char
"setlocal textwidth=80

setlocal nowrap

map! <F5> <Esc>:w<CR>:!ruby % <CR>
map  <F5> <Esc>:w<CR>:!ruby % <CR>


map! <F3> <Esc>:w<CR>:!ruby path_to_enlightenment.rb <CR>
map  <F3> <Esc>:w<CR>:!ruby path_to_enlightenment.rb <CR>
