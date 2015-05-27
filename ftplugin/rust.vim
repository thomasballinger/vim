map! <F5> <Esc>:w<CR>:!clear<CR>:!rustc % && ./`ls -tr <BAR> tail -n 1`<CR>
map <F5> <Esc>:w<CR>:!clear<CR>:!rustc -lm % && ./`ls -tr <BAR> tail -n 1`<CR>
