"


set expandtab

setlocal nowrap
map! <C-s> <Esc>:w<CR>:!clear<CR>:!nim c -r % <CR>
map <C-s> <Esc>:w<CR>:!clear<CR>:!nim c -r % <CR>

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
