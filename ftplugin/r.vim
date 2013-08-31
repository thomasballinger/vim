" this is filetype specific stuff - gets loaded on filetype detection

setlocal nowrap
map! <F5> <Esc>:w<CR>:!Rscript %<CR>
map  <F5> <Esc>:w<CR>:!Rscript %<CR>
map! <F6> <Esc>:w<CR>:!expect -c "spawn R --vanilla; send source('%')\n; interact"<CR>
map  <F6> <Esc>:w<CR>:!expect -c "spawn R --vanilla; send source('%')\n; interact"<CR>
map! <F7> <Esc>:w<CR>:!R --vanilla --quiet < %<CR>
map  <F7> <Esc>:w<CR>:!R --vanilla --quiet < %<CR>
