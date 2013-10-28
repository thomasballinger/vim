" this is markdown specific stuff - gets loaded on filetype detection


"off for pycon proposal - their markdown is funny
"setlocal textwidth=80
"setlocal nowrap 

setlocal wrap
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
setlocal nonumber

map! <F5> <Esc>:w<CR>:!markdown_py % > /tmp/mdpreview.html<CR>:!chrome /tmp/mdpreview.html<CR>
map  <F5> <Esc>:w<CR>:!markdown_py % > /tmp/mdpreview.html<CR>:!chrome /tmp/mdpreview.html<CR>
