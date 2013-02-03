setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
map! <F5> <Esc>:w<CR>:!coffee -c % && python -m SimpleHTTPServer<CR>
map  <F5> <Esc>:w<CR>:!coffee -c % && python -m SimpleHTTPServer<CR>
