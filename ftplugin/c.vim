" My c shortcuts
"
" For some reason this is getting loaded for .objc files
"

if &ft == "c"

  set expandtab

  setlocal nowrap
  map! <F5> <Esc>:w<CR>:!clear<CR>:!cc -lm % && ./`ls -tr <BAR> tail -n 1`<CR>
  map <F5> <Esc>:w<CR>:!clear<CR>:!cc -lm % && ./`ls -tr <BAR> tail -n 1`<CR>
  map! <F4> <Esc>:w<CR>:!clear<CR>:!cc -lm % && valgrind ./`ls -tr <BAR> tail -n 1`<CR>
  map <F4> <Esc>:w<CR>:!clear<CR>:!cc -lm % && valgrind ./`ls -tr <BAR> tail -n 1`<CR>

  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal smarttab
  setlocal expandtab
endif

if &ft == "objc"
  map! <F5> <Esc>:w<CR>:!clang -framework Foundation -fobjc-arc -g -lobjc *.m -o out; ./out <CR>
  map <F5> <Esc>:w<CR>:!clang -framework Foundation -fobjc-arc -g -lobjc *.m -o out; ./out <CR>
  echo "objective c vim config loaded"
endif

