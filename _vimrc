"  _                                 _             
" | |                               (_)            
" | |_   _  ___ __ _ ___  __ _ _   _ _ _ __  _ __  
" | | | | |/ __/ _` / __|/ _` | | | | | '_ \| '_ \    Lucas Lopes
" | | |_| | (_| (_| \__ \ (_| | |_| | | | | | | | |   github.com/lucasquin/Best_vimrc
" |_|\__,_|\___\__,_|___/\__, |\__,_|_|_| |_|_| |_|
"                           | |                    
"                           |_|   
"
" My custom .vimrc for Vim.


" Vundle vim config ************************************************************
set nocompatible              " be iMproved, required
filetype on                   " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" All of your Plugins must be added after the following line
"************************************************************
Plugin 'VundleVim/Vundle.vim'                               
Plugin 'scrooloose/nerdtree'
Plugin 'neoclide/coc.nvim'
"************************************************************
" All your plugins must be added in the line above

call vundle#end()            " required
filetype plugin indent on    " required
"*********************************************************************************



"*** Syntax and Layout ***********************************************************
syntax on                                     " Enable syntax highlight
set guifont=Fixedsys:h9			              " Font
set ruler                                     " Show cursor position in status bar
set backspace=indent,eol,start                " Backspace default im insert mode
set guioptions-=T                             " Hide gui options

set number                                    " Enable number lines
augroup numbertoggle                          " Show relative line number in normal mode mode only 
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
"**********************************************************************************



"*** Tab's ************************************************************************
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
"**********************************************************************************



"*** Remap keys *******************************************************************
" Shift tab default
inoremap <S-Tab> <C-d>

" Autoindent {
inoremap {<CR> {<CR>}<Esc>O

" CTRL+t open terminal in the current directory
map <C-t> :below vertical terminal<CR>
imap <C-t> <Esc>:below vertical terminal<CR>

" NERDTree
nmap <silent> <F2> :execute 'NERDTreeToggle ' . getcwd()<CR>
"**********************************************************************************




"*** File search ******************************************************************
set path+=**                      " Set directory to the current file editing
set wildmenu                      " Menu option in :find whith tab
set incsearch                     " Enable word highlighting in search with the /
"**********************************************************************************



"*** Encoding *********************************************************************
set encoding=utf-8                " Encodind with UTF-8
"**********************************************************************************



"*** Backups **********************************************************************
set nobackup
set noswapfile
set nowritebackup
"**********************************************************************************



"*** Coc.vim setup ****************************************************************
source C:\Program Files (x86)\Vim\coc.nvimrc
"**********************************************************************************
