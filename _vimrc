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

call plug#begin()
                           
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'          
Plug 'Mofiqul/dracula.nvim':
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

call plug#end()

"*** Global Sets **************************************************************
syntax on                                       " Enable syntax highlight
set nu                                          " Enable line numbers
set smartindent                                 " Automatically inserts one extra level of indentation in some cases
set hidden                                      " Hides the current buffer when a new file is openned
set incsearch                                   " Incremental search
set ignorecase                                  " Ingore case in search
set smartcase                                   " Consider case if there is a upper case character
set scrolloff=10                                " Minimum number of lines to keep above and below the cursor
set colorcolumn=100                             " Draws a line at the given line to keep aware of the line size
set signcolumn=yes                              " Add a column on the left. Useful for linting
set cmdheight=1                                 " Give more space for displaying messages
set updatetime=100                              " Time in miliseconds to consider the changes
set splitright                                  " Create the vertical splits to the right
set splitbelow                                  " Create the horizontal splits below
set autoread                                    " Update vim after file update from outside
set mouse=a                                     " Enable mouse support
filetype on                                     " Detect and set the filetype option and trigger the FileType Event
filetype plugin on                              " Load the plugin file for the file type, if any
filetype indent on                              " Load the indent file for the file type, if any
set backspace=indent,eol,start                  " Backspace default im insert mode
set ruler                                       " Show cursor position in status bar
set noshowmode                                  " Hide current mode

set nowrap                                      " Don't wrap lines
set linebreak                                   " Wrap lines at convenient points


augroup numbertoggle                            " Show relative line number in normal mode mode only 
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
"******************************************************************************



"*** Tab's ********************************************************************
set tabstop=4      " Show existing tab with 4 spaces width
set softtabstop=4  " Show existing tab with 4 spaces width
set shiftwidth=4   " When indenting with '>', use 4 spaces width
set expandtab      " On pressing tab, insert 4 spaces
set smarttab       " insert tabs on the start of a line according to shiftwidth
"******************************************************************************



"*** Remap keys ***************************************************************
inoremap <S-Tab> <C-d>                                          " Shift tab default
inoremap {<CR> {<CR>}<Esc>O                                     " Autoindent {
map <C-t> :below vertical terminal<CR>                          " CTRL+t open terminal in the current directory
imap <C-t> <Esc>:below vertical terminal<CR>
nmap <silent> <F2> :execute 'NERDTreeToggle ' . getcwd()<CR>    " NERDTree

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"******************************************************************************



"*** File search **************************************************************
set path+=**                      " Set directory to the current file editing
set wildmenu                      " Menu option in :find whith tab
set incsearch                     " Enable word highlighting in search with the /
"******************************************************************************



"*** Encoding *****************************************************************
set encoding=utf-8                " Encodind with UTF-8
"******************************************************************************



"*** Backups ******************************************************************
set nobackup
set noswapfile
set nowritebackup
"******************************************************************************



"*** Theme ********************************************************************
let g:airline_theme='wombat'      " Airline theme
colorscheme dracula               " Color

" Transparent background
if (has("nvim")) 
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif
"******************************************************************************

let g:NERDTreeWinSize=60

"*** Coc **********************************************************************
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

source ~/AppData/Local/nvim/coc.nvimrc

"******************************************************************************



"*** ALE **********************************************************************
let g:ale_linters = {
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1
