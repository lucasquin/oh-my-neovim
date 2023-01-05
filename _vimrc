"  _                                 _             
" | |                               (_)            
" | |_   _  ___ __ _ ___  __ _ _   _ _ _ __  _ __  
" | | | | |/ __/ _` / __|/ _` | | | | | '_ \| '_ \    Lucas Lopes
" | | |_| | (_| (_| \__ \ (_| | |_| | | | | | | | |   github.com/lucasquin/vim-config
" |_|\__,_|\___\__,_|___/\__, |\__,_|_|_| |_|_| |_|
"                           | |                    
"                           |_|   
"
" My custom vim config for Vim | Neovim.

call plug#begin()
                           
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'          
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }
Plug 'preservim/nerdcommenter'

" Neovim only
if (has("nvim"))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

call plug#end()

"*** Global Sets ********************************************************************************************
syntax on                                       " Enable syntax highlight
set nu                                          " Enable line numbers
set smartindent                                 " Automatically inserts one extra level of indentation in some cases
set hidden                                      " Hides the current buffer when a new file is openned
set incsearch                                   " Incremental search
set ignorecase                                  " Ingore case in search
set smartcase                                   " Consider case if there is a upper case character
set scrolloff=10                                " Minimum number of lines to keep above and below the cursor
set colorcolumn=110                             " Draws a line at the given line to keep aware of the line size
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

" Show relative line number in normal mode mode only
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
"************************************************************************************************************



"*** Layout *************************************************************************************************
let g:airline_theme='dracula'                   " Airline theme
colorscheme dracula                             " Color

" Colors bits
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Transparent background
if (has("nvim")) 
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
endif

let g:airline#extensions#tabline#enabled = 1    " Airline config
let g:airline_powerline_fonts = 1

"Highlight yanked text
function! HighlightWordUnderCursor()
      if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
          exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
      else
          match none
      endif
endfunction
nmap <silent> <F3> :call HighlightWordUnderCursor()<cr>
"************************************************************************************************************


"*** Tab's **************************************************************************************************
set tabstop=4                                   " Show existing tab with 4 spaces width
set softtabstop=4                               " Show existing tab with 4 spaces width
set shiftwidth=4                                " When indenting with '>', use 4 spaces width
set expandtab                                   " On pressing tab, insert 4 spaces
set smarttab                                    " insert tabs on the start of a line according to shiftwidth
"************************************************************************************************************



"*** Remap keys *********************************************************************************************
inoremap <S-Tab> <C-d>                                          " Shift tab default
map <C-t> :below vertical terminal<CR>                          " CTRL+t open terminal in the current directory
imap <C-t> <Esc>:below vertical terminal<CR>

" Navigate splits with CTRL + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Telescope
if (has("nvim"))
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif
"************************************************************************************************************



"*** File search **************************************************************
set path+=**                      " Set directory to the current file editing
set wildmenu                      " Menu option in :find whith tab
set incsearch                     " Enable word highlighting in search with the /
"************************************************************************************************************



"*** Encoding ***********************************************************************************************
set encoding=utf-8                " Encodind with UTF-8
"************************************************************************************************************



"*** Backups ************************************************************************************************
set nobackup
set noswapfile
set nowritebackup
"************************************************************************************************************



" COC *******************************************************************************************************
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> <F2> <Plug>(coc-definition)
nmap <silent> <C-F2> <Plug>(coc-references)
nmap <silent> <C-F12> <Plug>(coc-implementation)
nmap <silent> <F12> <Plug>(coc-type-definition)

"************************************************************************************************************
