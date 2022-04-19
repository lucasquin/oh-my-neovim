" Layout
syntax on
set guifont=Consolas:h15
set ruler
set backspace=indent,eol,start
set guioptions-=T

set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
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
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Left>
inoremap ( ()<Left>

" Encoding
set encoding=utf-8

" Backups
set nobackup
set noswapfile
set nowritebackup
