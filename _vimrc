set nocompatible

" Layout
syntax on
set guifont=Fixedsys:h17
set ruler
set backspace=indent,eol,start
set guioptions-=T
set nu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

" Edicao
set hls
set is
set cb=unnamed
set ts=4
set sw=4
set si

" Remap keys

inoremap <S-Tab> <C-d>

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

inoremap [ []<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" Encoding
set encoding=utf-8

" Backups
set nobackup
set noswapfile
set nowritebackup
