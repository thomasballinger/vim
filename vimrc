" Thomas Ballinger's vimrc
" stuff
set nocompatible
let mapleader=","

" cursor shape in insert mode, for terminals like Konsole and iTerm2
" doesn't work in terminal multiplexers, which I always use, so a bit silly
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

filetype off

"set runtimepath=/path-to-config/config/vim,$VIMRUNTIME
"This does the above in a more generic way:
" it adds the folder this vimrc file is in to the rtp
let current_file=expand("<sfile>")
let current_file=resolve(current_file)
let current_folder=fnamemodify(current_file,":p:h")
let current_folder=current_folder . "/"
let &runtimepath=current_folder . ",".$VIMRUNTIME

"vundle setup
let &runtimepath=&runtimepath.",". current_folder . "/bundle/vundle"
unlet current_file
unlet current_folder
"echo &runtimepath
call vundle#rc()
Bundle 'gmarik/vundle'

" :BundleInstall to install

" Bundles I'm trying out
Bundle 'repos-scala/scala-vundle'
Bundle 'sophacles/vim-processing'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mrtazz/simplenote.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'ZoomWin'
Bundle 'AndrewRadev/sideways.vim'
    nnoremap <leader>h :SidewaysLeft<CR>
    nnoremap <leader>l :SidewaysRight<CR>
Bundle 'Rip-Rip/clang_complete'
Bundle 'guns/vim-clojure-static'
Bundle 'paredit.vim'
Bundle 'sjl/gundo.vim'
Bundle 'JuliaLang/julia-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'chrisbra/color_highlight'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'
Bundle 'tpope/vim-rsi.git'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
Bundle 'Valloric/YouCompleteMe'
" see https://github.com/Valloric/YouCompleteMe for installation instructions

" Bundles I'm attached to
Bundle 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabLongestHighlight = 0
    let g:SuperTabLongestEnhanced = 1
    let g:SuperTabCrMapping = 1
    set completeopt+=longest
Bundle 'jimenezrick/vimerl'
Bundle 'kana/vim-arpeggio'
    "My Escape Key - I like jk, but chorded, so I use Arpeggio
    call arpeggio#load()
    if exists("*arpeggio#load")
        Arpeggioimap jk <Esc>
        Arpeggiocmap jk 
        Arpeggioimap JK <Esc>
        Arpeggiocmap JK 
    else
        imap kj <Esc>
        imap jk <Esc>
    endif
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'scrooloose/nerdtree'
    nmap <leader>m :NERDTreeToggle<CR>
    nmap <leader>n :NERDTreeFind<CR>
    let NERDTreeIgnore = ['\.pyc$']

nmap <leader>i :so $MYVIMRC<CR>:BundleInstall<CR>

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
nnoremap ;; <c-^>
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

set statusline=%{fugitive#statusline()}
set laststatus=2 
if has("statusline") 
        set statusline=%<%f\ %{fugitive#statusline()}%h%m%r%=%k[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}][U+%04B]\ %-12.(%l,%c%V%)\ %P 
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

" Hacker to use .py for .tac files
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
