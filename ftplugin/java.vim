" this is java specific stuff - gets loaded on filetype detection

" make is always F4 in Tom's vimrc
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab

"automatic return when inserting beyond 80th char
"setlocal textwidth=80

setlocal nowrap

setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
map! <F5> <Esc>:w<CR>:!javac % <CR>:!java % <CR>
map  <F5> <Esc>:w<CR>:!javac % <CR>:!java %:r <CR>

