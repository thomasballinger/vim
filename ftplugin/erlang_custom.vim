" erlang 
"

map! <F5> <Esc>:w<CR>:!erl -compile *.erl && erl -compile % && erl -noshell -s `echo % <BAR> sed 's/\(.*\)..../\1/'` main -s init stop<CR>
map <F5> <Esc>:w<CR>:!erl -compile *.erl && erl -compile % && erl -noshell -s `echo % <BAR> sed 's/\(.*\)..../\1/'` main -s init stop<CR>


setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
