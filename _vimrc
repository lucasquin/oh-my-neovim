" _vimrc by lucasquin  | github.com/lucasquin/

set nocompatible

" Enable windows shortcuts
" source $VIMRUNTIME/mswin.vim 

" Gui config
set guioptions-=T
set guioptions-=r

" Encoding with UTF-8
set encoding=utf-8

" Show line numbers
set number

" Enable line and column on status bar
set ruler

" Enable syntax highlighting
syntax enable

" Search
set is hls is scs

" Font Fixedsys
set guifont=Fixedsys:h15

" Backups
set nobackup
set noswapfile
set nowritebackup

" Ident
set ai
set ci
inoremap <S-Tab> <C-d>
set ts=4
set expandtab
set shiftwidth=4

" Show a visual line under the cursor's current line
set cursorline

" Show the matching part of the pair for [] {} and ()
set showmatch

" NERDTree plugin config
" autocmd  VimEnter  * NERDTree
