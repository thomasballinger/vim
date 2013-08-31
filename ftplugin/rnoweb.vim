" this is filetype specific stuff - gets loaded on filetype detection

setlocal nowrap
map! <F5> <Esc>:w<CR>:!R CMD Sweave % && R CMD pdflatex `echo % <bar> head -c -4`tex<CR>
map  <F5> <Esc>:w<CR>:!R CMD Sweave % && R CMD pdflatex `echo % <bar> head -c -4`tex<CR>
