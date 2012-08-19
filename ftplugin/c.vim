" My c shortcuts

set expandtab

setlocal nowrap
map! <F5> <Esc>:w<CR>:!cc -lm % && ./`ls -tr <BAR> tail -n 1`<CR>
map <F5> <Esc>:w<CR>:!cc -lm % && ./`ls -tr <BAR> tail -n 1`<CR>
map! <F4> <Esc>:w<CR>:!cc -lm % && valgrind ./`ls -tr <BAR> tail -n 1`<CR>
map <F4> <Esc>:w<CR>:!cc -lm % && valgrind ./`ls -tr <BAR> tail -n 1`<CR>

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
