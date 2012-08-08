" Thomas Ballinger's vimrc
"

set nocompatible
let mapleader=","

"set runtimepath=/path-to-config/config/vim,$VIMRUNTIME
"This does the above in a more generic way
let current_file=expand("<sfile>")
let current_file=resolve(current_file)
let current_file=fnamemodify(current_file,":p:h")
let current_file=current_file . "/"
let &runtimepath=current_file . ",".$VIMRUNTIME
"echo current_file
"echo &runtimepath
unlet current_file

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

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

if v:version >= 703
    set undodir=~/.vimundos
    set undofile
else
    echo "you are using an old version of vim, upgrade!"
endif


setlocal smarttab
setlocal expandtab
set autoindent
set smartindent

" default - set other stuff in ftplugins
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

set wildmenu
set wildmode=longest,list
set wildignore+=*.swp,*.bak,*.pyc
set title

" this works with tmux only if you reattache to user space
set clipboard+=unnamed

" I'd rather toggle it manually
set nofoldenable
nnoremap <space> za
vnoremap <space> zf

"Training Tools
"to help me learn not to use the arrow keys in cmd mode:

"map <left> <nop>
"map <right> <nop>
"but up and down are used by the mouse scroll wheel, which I use
"map <up> <nop>
"map <down> <nop>

map j gj
map k gk

"Really Custom Stuff

"nerdtree settings
nmap <leader>m :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>


"Window stuff
set splitright
"easier moving between windows
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>

"makes c-w work in insert
imap <C-w> <C-O><C-w>



"My Escape Key - I like jk, but chorded, so I use Arpeggio
"imap jj <Esc>
"imap kj <Esc>
"imap jk <Esc>
call arpeggio#load()
Arpeggioimap jk <Esc>
Arpeggiocmap jk 



autocmd! bufwritepost .vimrc source ~/.vimrc
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

" Best autocompletion ever!
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 0
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 1
set completeopt+=longest
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
let g:Powerline_symbols = 'fancy'




"set cursorline
set number

" show matching pairs like () and {}
set showmatch
set matchtime=3

" Line Wrapping 
" This should depend on the file!
"set nowrap
"set linebreak  " Wrap at word dfasa sdf asdf asd f asdf asd fas d fasd fas df asd fasd f asdf dasf asd fasd fasdf
"set wrap


ab funciton function
ab funtcion function
ab funcion  function
ab funtion  function
