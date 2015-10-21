" Thomas Ballinger's vimrc
" stuff
"

set nocompatible
let mapleader=","

" cursor shape in insert mode, for terminals like Konsole and iTerm2
" doesn't work in terminal multiplexers, which I always use, so a bit silly
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

filetype off


if 1
    " requred for neobundle: https://github.com/Shougo/neobundle.vim
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'



    " Bundles I'm trying out
    "NeoBundle 'ivanov/vim-ipython'
    NeoBundle 'AndrewRadev/linediff.vim'
    NeoBundle 'Blackrush/vim-gocode'
    NeoBundle 'Rip-Rip/clang_complete'
    NeoBundle 'alfredodeza/coveragepy.vim'
    NeoBundle 'chrisbra/color_highlight'
    NeoBundle 'greyblake/vim-preview'
    NeoBundle 'guns/vim-clojure-static'
    NeoBundle 'guns/vim-sexp'
    NeoBundle 'hail2u/vim-css3-syntax'
    NeoBundle 'jimenezrick/vimerl'
    NeoBundle 'jnwhiteh/vim-golang'
    NeoBundle 'mattn/gist-vim'
    NeoBundle 'mattn/webapi-vim'
    NeoBundle 'mitsuhiko/vim-jinja'
    NeoBundle 'mrtazz/simplenote.vim'
    NeoBundle 'paredit.vim'
    NeoBundle 'repos-scala/scala-vundle'
    NeoBundle 'rizzatti/dash.vim'
    NeoBundle 'rizzatti/funcoo.vim'
    NeoBundle 'scrooloose/nerdcommenter'
    NeoBundle 'sjl/gundo.vim'
    NeoBundle 'sophacles/vim-processing'
    NeoBundle 'tpope/vim-abolish'
    NeoBundle 'tpope/vim-classpath'
    "NeoBundle 'tpope/vim-endwise'
    NeoBundle 'tpope/vim-fireplace'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'tpope/vim-repeat'
    NeoBundle 'tpope/vim-rsi'
    NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'rust-lang/rust.vim'
    NeoBundle 'bronson/vim-trailing-whitespace'

    " Plugins with options
    NeoBundle 'AndrewRadev/sideways.vim'
        nnoremap <leader>h :SidewaysLeft<CR>
        nnoremap <leader>l :SidewaysRight<CR>
    NeoBundle 'kien/rainbow_parentheses.vim'
        au VimEnter *
                    \ try | exec RainbowParenthesesToggle | catch | | endtry
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    NeoBundle 'Valloric/YouCompleteMe'
    " see https://github.com/Valloric/YouCompleteMe for installation instructions

    NeoBundle 'ervandew/supertab'
        let g:SuperTabDefaultCompletionType = "context"
        let g:SuperTabLongestHighlight = 0
        let g:SuperTabLongestEnhanced = 1
        let g:SuperTabCrMapping = 1
        set completeopt+=longest
    NeoBundle 'kana/vim-arpeggio'
    NeoBundle 'kchmck/vim-coffee-script'
    NeoBundle 'kien/ctrlp.vim'
    NeoBundle 'mitechie/pyflakes-pathogen'
    NeoBundle 'scrooloose/syntastic', { 'for': ['javascript', 'python', 'haskell'] }
    NeoBundle 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    NeoBundle 'Xuyuanp/nerdtree-git-plugin',  { 'on':  'NERDTreeToggle' }

    call neobundle#end()
    NeoBundleCheck
endif

let g:syntastic_python_checkers=['flake8']

nmap <leader>m :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']

" it adds the folder this vimrc file is in to the rtp
let current_file=expand("<sfile>")
let current_file=resolve(current_file)
let current_folder=fnamemodify(current_file,":p:h")
let current_folder=current_folder . "/"
let &runtimepath=&runtimepath . "," . current_folder
let &runtimepath=&runtimepath . "," . current_folder . "/after"
unlet current_file
unlet current_folder


" set default 'runtimepath' (without ~/.vim folders)
"let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
"let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
"let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)









filetype plugin indent on

if has("gui_running")
    "colorscheme solarized
    set autochdir
    set background=light
    set columns=100
    set guifont=Liberation\ Mono\ 10
    set guioptions-=L
    set guioptions-=R
    set guioptions-=T
    set guioptions-=T
    set guioptions-=l
    set guioptions-=m
    set guioptions-=r
    set keymodel=
    set lines=60
    set nomousehide
    set t_Co=256
else
    set background=dark
endif

" Don't backup files in Dropbox
autocmd BufNewFile,BufRead */Dropbox/* set nobackup nowritebackup noswapfile

if &diff
    set nospell
endif

function! EnsureDirExists (dir)
  " from http://stackoverflow.com/a/8462159/398212, for windows compat
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction

if v:version >= 703
    " I'm confused about when ~ works for $HOME
    let myundofile = $HOME . '/.vimundos'
    call EnsureDirExists(myundofile)
    set undofile
    let &undodir = myundofile
    nnoremap U :GundoToggle<CR>
else
    "echo "you are using an old version of vim, upgrade!"
endif

setlocal smarttab
" this is the one that causes tabs to be inserted instead of spaces in insert mode
setlocal expandtab
set autoindent
set smartindent

" default - set other stuff in ftplugins
setlocal tabstop=4
" find out why I use this
setlocal softtabstop=4
setlocal shiftwidth=4


set wildmenu
set wildmode=longest,list
set wildignore+=*.swp,*.bak,*.pyc
set title

" this works with tmux only if you reattach to user space
set clipboard+=unnamed

" mouse support!
set mouse+=a
" http://superuser.com/a/550482/53713
if &term =~ '^screen-256color'
    set ttymouse=xterm2
endif

" I'd rather toggle it manually
set nofoldenable
nnoremap <space> za
vnoremap <space> zf

"Training Tools
"
"to get me to stop hitting :w all the time:
function! Annoy ()
    for i in [1, 2, 3]
        echo "Stop that!"
        sleep 1
    endfor
    echo "Stop that!"
endfunction
"command W call Annoy()
"ca w W

"to help me learn not to use the arrow keys in cmd mode:
"map <left> <nop>
"map <right> <nop>
""but up and down are used by the mouse scroll wheel, which I use
""map <up> <nop>
""map <down> <nop>

"Disable Ex mode, which I hit a lot by accident because ctrl-q is my tmux key
nnoremap Q <nop>

"scrolling
map j gj
map k gk

set nostartofline

"Window stuff
set splitright

"makes c-w work in insert
imap <C-w> <C-O><C-w>




autocmd! bufwritepost .vimrc source ~/.vimrc
"why in the world would this be useful?
"
map <leader>V :
"nnoremap ;; <c-^>
map <silent> <leader>VV :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <leader>r :registers<CR>
cmap w!! w !sudo tee % >/dev/null


au filetype help set nonumber
au filetype help set nospell

set modeline

set pastetoggle=<F2>

set autowrite

set noerrorbells
"Below is the magic one to stop beeping
set visualbell t_vb=
set autoread

"highlight Pmenu ctermfg=1 ctermbg=4 guibg=30
"colors
syntax enable

" Searching 
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

" Status Line 
set showcmd
set ruler " Show ruler
set scrolloff=3 " keep 3 lines when scrolling
set laststatus=2 "show the statusline, even with just one file open

set laststatus=2 
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''} 
if has("statusline") 
    set statusline=%<%f\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}%h%m%r%=%k[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}][U+%04B]\ %-12.(%l,%c%V%)\ %P 
endif

"set cursorline
set number

" show matching pairs like () and {}
set showmatch
set matchtime=3

ab fucnotin function
ab fucntion function
ab fucntion function
ab funcion  function
ab funciotn function
ab funciton function
ab functino function
ab functoin function
ab funtcion function
ab funtion  function
ab funtoin  function

ab protptype prototype

" text corrections

ab langauges languages
ab langauge language


function! g:Refresh_hy_python_preview()
  redir => message
  redir END
  let pyfile = substitute(bufname("%"), ".hy", "", "") . ".generated.py"
  let errfile = substitute(bufname("%"), ".hy", "", "") . ".error"
  exec "silent !~/hy/bin/hy2py % > " . pyfile . " 2> " . errfile . " || cat " . errfile . " > " . pyfile
  call MyPreviewVSplit(pyfile)
  set nomodified
  "exec "silent !rm " . pyfile . " " . errfile
  redraw!
endfunction

function! MyPreviewVSplit( fname )
    let curbufnum=bufwinnr("%")
    let bufnum=bufnr(expand(a:fname))
    let winnum=bufwinnr(bufnum)
    if winnum != -1
        exe winnum . "wincmd w"
        e
    else
        " Make new split as usual
        exe "vsplit " . a:fname
    endif
    filetype detect
    exe curbufnum . "wincmd w"
endfunction

let g:autoHyPythonPreview = 0

function! g:ToggleAutoHyPythonPreview()
    if g:autoHyPythonPreview == 0
        "au BufWritePost * call g:Refresh_hy_python_preview()
        au CursorHold *.hy call g:Refresh_hy_python_preview()
        au CursorHoldI *.hy call g:Refresh_hy_python_preview()
        echo "Hy -> Python preview turned on"
        set updatetime=500
        let g:autoHyPythonPreview = 1
    else
        "au! BufWritePost
        let g:autoHyPythonPreview = 0
        au! CursorHold
        au! CursorHoldI
        set updatetime=4000
        echo "Hy -> Python preview turned off"
    endif
endfunction

" Hack to use .py for .tac files
autocmd BufNewFile,BufRead *.tac set filetype=python
autocmd BufNewFile,BufRead *.tac map! <buffer> <F5> <Esc>:w<CR>:!twistd -ny % <CR>
autocmd BufNewFile,BufRead *.tac map  <buffer> <F5> <Esc>:w<CR>:!twistd -ny % <CR>

" Hack to use clojure filetype for hy
autocmd BufNewFile,BufRead *.hy set filetype=clojure
autocmd BufNewFile,BufRead *.hy map! <buffer> <F5> <Esc>:w<CR>:!hy % <CR>
autocmd BufNewFile,BufRead *.hy map  <buffer> <F5> <Esc>:w<CR>:!hy % <CR>
autocmd BufNewFile,BufRead *.hy map! <buffer> <F4> <Esc>:w<CR>:call g:Refresh_hy_python_preview()<CR>
autocmd BufNewFile,BufRead *.hy map  <buffer> <F4> <Esc>:w<CR>:call g:Refresh_hy_python_preview()<CR>
autocmd BufNewFile,BufRead *.hy map! <buffer> <F3> :call g:ToggleAutoHyPythonPreview()<CR>
autocmd BufNewFile,BufRead *.hy map  <buffer> <F3> :call g:ToggleAutoHyPythonPreview()<CR>

:let g:colorizer_auto_filetype='css,scss,html'

"while my left shift key doesn't work
":nmap ; :
:nmap ; h

set cpoptions+=ces$

