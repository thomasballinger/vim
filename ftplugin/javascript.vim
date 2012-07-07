" this is javascript mocha specific stuff - gets loaded on filetype detection
"
set tabstop=4
set shiftwidth=4
set softtabstop=4

setlocal nowrap
map! <F5> <Esc>:w<CR>:!node % <CR>
map  <F5> <Esc>:w<CR>:!node %<CR>

map! <F4> <Esc>:w<CR>:!jshint % <CR>
map  <F4> <Esc>:w<CR>:!jshint %<CR>

map! <F3> <Esc>:w<CR>:!mocha --reporter dot --bail<CR>
map  <F3> <Esc>:w<CR>:!mocha --reporter dot --bail<CR>

setlocal makeprg=jshint\ %
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m

ab func function(

ab raise throw
