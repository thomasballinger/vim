map! <buffer> <C-s> <Esc>:write<CR>:!touch % && ghc --make % && ./`ls -tr <BAR> tail -n 1`<CR>
map  <buffer> <C-s> <Esc>:write<CR>:!touch % && ghc --make % && ./`ls -tr <BAR> tail -n 1`<CR>
map! <buffer> <F5> <Esc>:write<CR>:silent !ghci % <CR>:redraw!<CR>
map  <buffer> <F5> <Esc>:write<CR>:silent !ghci % <CR>:redraw!<CR>


" Tab specific option
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple
