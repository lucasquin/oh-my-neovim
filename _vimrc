"  _                                 _             
" | |                               (_)            
" | |_   _  ___ __ _ ___  __ _ _   _ _ _ __  _ __  
" | | | | |/ __/ _` / __|/ _` | | | | | '_ \| '_ \    Lucas Lopes
" | | |_| | (_| (_| \__ \ (_| | |_| | | | | | | | |   github.com/lucasquin/Best_vimrc
" |_|\__,_|\___\__,_|___/\__, |\__,_|_|_| |_|_| |_|
"                           | |                    
"                           |_|   
"
" My custom vim config for Vim | Neovim.

call plug#begin()
                           
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'          
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'jiangmiao/auto-pairs'

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
let g:airline_theme='wombat'                    " Airline theme
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


let g:NERDTreeWinSize=60                        " NERDTree size column

let g:airline#extensions#tabline#enabled = 1    " Airline config
let g:airline_powerline_fonts = 1

" Highlight yanked text
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
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
inoremap {<CR> {<CR>}<Esc>O                                     " Autoindent {
map <C-t> :below vertical terminal<CR>                          " CTRL+t open terminal in the current directory
imap <C-t> <Esc>:below vertical terminal<CR>
nmap <silent> <F2> :execute 'NERDTreeToggle ' . getcwd()<CR>    " NERDTree

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



"*** Encoding *****************************************************************
set encoding=utf-8                " Encodind with UTF-8
"************************************************************************************************************



"*** Backups ************************************************************************************************
set nobackup
set noswapfile
set nowritebackup
"************************************************************************************************************



"*** ALE ****************************************************************************************************
let g:ale_linters = {
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1
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
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> <C-12> <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"************************************************************************************************************
