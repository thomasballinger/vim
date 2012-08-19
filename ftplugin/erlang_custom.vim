" erlang 
"


map! <F5> <Esc>:w<CR>:!erl -compile % && erl -noshell -s `ls -tr <BAR> tail -n 1 <BAR> sed 's/\(.*\)...../\1/'` main -s init stop<CR>
map <F5> <Esc>:w<CR>:!erl -compile % && erl -noshell -s `ls -tr <BAR> tail -n 1 <BAR> sed 's/\(.*\)...../\1/'` main -s init stop<CR>
