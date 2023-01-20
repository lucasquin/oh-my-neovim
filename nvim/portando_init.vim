call plug#begin()
                           
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'          
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

" Neovim only
if (has("nvim"))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }
    Plug 'nvim-telescope/telescope.nvim'
endif

call plug#end()

"*** Global Sets ********************************************************************************************
set splitright                                  " Create the vertical splits to the right
set splitbelow                                  " Create the horizontal splits below
filetype plugin on                              " Load the plugin file for the file type, if any
filetype indent on                              " Load the indent file for the file type, if any

"************************************************************************************************************



"*** Layout *************************************************************************************************
let g:airline_theme='dracula'                   " Airline theme
colorscheme dracula                             " Color
autocmd VimEnter * NoNeckPain                   " Centralize buffer

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



"*** Remap keys *********************************************************************************************

" Telescope
"
if (has("nvim"))
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif
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
