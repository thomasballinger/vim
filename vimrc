" Thomas Ballinger's vimrc
"
set nocompatible
let mapleader=","

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
Bundle 'mitechiu/pyflakes-pathogen'
Bundle 'scrooloose/nerdtree'
    nmap <leader>m :NERDTreeToggle<CR>
    nmap <leader>n :NERDTreeFind<CR>

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

" Helps for 
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
""but up and down are used by the mouse scroll wheel, which I use
""map <up> <nop>
""map <down> <nop>

map j gj
map k gk

"Really Custom Stuff

"Window stuff
set splitright
"easier moving between windows
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>

"makes c-w work in insert
imap <C-w> <C-O><C-w>




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

ab funciton function
ab funtcion function
ab funcion  function
ab funtion  function
