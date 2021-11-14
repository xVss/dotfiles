"              ███
"             ░░░
" █████ █████ ████  █████████████
"░░███ ░░███ ░░███ ░░███░░███░░███
" ░███  ░███  ░███  ░███ ░███ ░███
" ░░███ ███   ░███  ░███ ░███ ░███
"  ░░█████    █████ █████░███ █████
"   ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░

" ================== GENERAL ====================

"Change leader key
"let g:mapleader = "\<Space>"

"Needed for some staff
set nocompatible
filetype plugin on

"Syntax highlight
syntax on

"Changing tab on a modified buffer doesn't make vim angry anymore
set hidden

set wrap
set encoding=utf-8

"Real time cursor position
set ruler
hi Cursorline cterm=NONE ctermbg=white ctermfg=red
hi Folded ctermbg=Black

"Command bar height
set cmdheight=1

"Setting relative line number except on the line i'm on
set relativenumber
set number

"Change new window position when splitting
set splitbelow
set splitright

"faster completion?
"TODO
set updatetime=300

"??
"TODO
set timeoutlen=500

set mouse=a

"256 color support
set t_Co=256

"TEXT
"set textwidth=72
set linebreak
set showbreak=+++

set showmatch

"SEARCH
set hlsearch
set smartcase
set ignorecase
set incsearch

"TAB SPACE INDENT
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

"Treat dash-separated words as a single word
set iskeyword+=-

"WILD MENU
set wildmenu
"set wildmode=list,longest,full

"TMUX
set term=screen-256color

"cd to the directory containing the file we are editing
set autochdir

set undolevels=1000
set backspace=indent,eol,start

"Set trailing spaces as errors
"if has("match")
match ErrorMsg '\s\+$'

"Avoid some messages
set shortmess=aoOtTI

"Prevents truncated yanks and deletes
set viminfo='20,<1000,s1000

"set a different information bar
set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

set autoread
au FocusGained,BufEnter * checktime

set lazyredraw

"Prompt change based on current mode
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

set omnifunc=syntaxcomplete#Complete

"Open on the last position you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" disable arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

"=================  MAPPINGS ====================

map Y y$
nnoremap n nzzzv
nnoremap N Nzzzv

"Disable search highlight
nnoremap ,m :nohlsearch<CR>

"Copy with C-c in visual mode
vnoremap <C-c> "+y
"Paste with C-a
inoremap <C-a> <Esc>"+p
nnoremap <C-a> "+p

"Toogle highlight of the row/column of the cursor
nnoremap Hh :set cursorline! cursorcolumn!<CR>
nnoremap Hl :set cursorline!<CR>

"Resize windows with alt + hjkl
nnoremap <C-M-j>    :resize -2<CR>
nnoremap <C-M-k>    :resize +2<CR>
nnoremap <C-M-h>    :vertical resize -2<CR>
nnoremap <C-M-l>    :vertical resize +2<CR>

"TAB in normal mode move us to the next buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB previous buffer
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

"" Better window navigation
" Terminal mode:
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <C-h> <Esc><c-w>h
inoremap <C-j> <Esc><c-w>j
inoremap <C-k> <Esc><c-w>k
inoremap <C-l> <Esc><c-w>l
" Visual mode:
vnoremap <C-h> <Esc><c-w>h
vnoremap <C-j> <Esc><c-w>j
vnoremap <C-k> <Esc><c-w>k
vnoremap <C-l> <Esc><c-w>l
" Normal mode:
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l


"=================  AUTOCOMMANDS ================


"=================  PLUGIN ======================

if filereadable(expand("~/.vim/autoload/plug.vim"))

    call plug#begin('~/.vim/autoload/plugged')
    Plug 'vimwiki/vimwiki'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'
    call plug#end()

    let g:vimwiki_list = [ {'path':'~/archive/vimwiki', 'path_html':'~/archive/vimwiki_html'},{'path':'~/archive/wiki/basi', 'path_html':'~/archive/wiki_html/basi'}]
endif
