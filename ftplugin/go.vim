map! <buffer> <F5> <Esc>:w<CR>:!clear<CR>:!go build % && ./`ls -tr <BAR> tail -n 1`<CR>
map <buffer> <F5> <Esc>:w<CR>:!clear<CR>:!go build % && ./`ls -tr <BAR> tail -n 1`<CR>
map! <buffer> <F4> <Esc>:w<CR>:%!gofmt % <CR>
map <buffer> <F4> <Esc>:w<CR>:%!gofmt % <CR>
