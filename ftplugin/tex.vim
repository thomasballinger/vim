" this is python specific stuff - gets loaded on filetype detection

setlocal nowrap

setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
map <F5> <Esc>:w<CR>:!pdflatex %<CR>
map! <F5> <Esc>:w<CR>:!pdflatex %<CR>

