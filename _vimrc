set nocompatible              " be iMproved, required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Layout
syntax on
set guifont=DejaVuSansMono_Nerd_Font_Mono:h15
set ruler
set backspace=indent,eol,start
set guioptions-=T
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

colorscheme gruvbox
let g:airline_powerline_fonts = 1

" Edicao
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Remap keys
inoremap <S-Tab> <C-d>
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Left>
inoremap ( ()<Left>

" Encoding
set encoding=utf-8

" Backups
set nobackup
set noswapfile
set nowritebackup
set path+=**
set wildmenu

set laststatus=2
