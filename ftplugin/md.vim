" this is python specific stuff - gets loaded on filetype detection

" make is always F4 in Tom's vimrc
setlocal textwidth=80
setlocal nowrap

map! <F5> <Esc>:w<CR>:!md_preview.py % <CR>
map  <F5> <Esc>:w<CR>:!md_preview.py % <CR>
