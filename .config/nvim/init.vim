call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-airline/vim-airline'

Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

Plug 'octol/vim-cpp-enhanced-highlight'

"Plug 'Valloric/YouCompleteMe'

Plug 'tpope/vim-fugitive'
Plug 'will133/vim-dirdiff'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************

"" Tabs
set tabstop=4
set shiftwidth=2
set expandtab

set list
set splitright

"" Set map leader
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set ignorecase
set smartcase

"" Autowrite before builds
set autowrite

"" Confirm write on quit
set confirm

":set mouse=a

"" open nerdtree on start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" delete buffer for deleted files in nerdtree
let NERDTreeAutoDeleteBuffer=1

"" nerdtree style
let NERDTreeMinimalUI=1

"" YouCompleteMe settings
let g:ycm_auto_trigger=0
let g:ycm_min_num_of_chars_for_completion=4

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax on
set ruler
set number

set title
set titleold="Terminal"
set titlestring=%F

colorscheme tender
let g:airline_theme='tender'

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background

  function! s:base16_customize() abort
    "call Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
    call Base16hi("Type",        g:base16_gui0A, "", g:base16_cterm0A, "", "none", "")
    call Base16hi("Statement",   g:base16_gui0E, "", g:base16_cterm0E, "", "", "")
    call Base16hi("Identifier",  g:base16_gui0C, "", g:base16_cterm0C, "", "none", "")
    call Base16hi("makeIdent",   g:base16_gui05, "", g:base16_cterm05, "", "none", "")
    call Base16hi("NERDTreeCWD", g:base16_gui0A, "", g:base16_cterm0A, "", "none", "")
  endfunction

  augroup on_change_colorschema
    autocmd!
    autocmd VimEnter * call s:base16_customize()
  augroup END
endif

let g:cpp_class_decl_highlight = 1

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let &cc = '100'

hi SpellBad ctermfg=red

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev X x

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Fast closing
noremap <leader><leader> :q<cr>

"" Buffer nav
noremap <A-n> :bn<cr>
noremap <A-p> :bp<cr>

"" Close buffer
noremap <leader>q :BD<cr>
noremap <leader>Q :BD!<cr>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Build
map <f5> :make

"" Switching windows
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l
noremap <A-h> <C-w>h

noremap <A-t> :NERDTreeFocus<cr>
noremap <leader>t :NERDTreeToggle<cr>

nnoremap <leader>c :call YcmToggle()<cr>

function! YcmToggle()
  if g:ycm_auto_trigger
    let g:ycm_auto_trigger = 0
  else
    let g:ycm_auto_trigger = 1
  endif
endfunction

"" Ruler
nnoremap <leader>r :let &cc = &cc == '' ? '100' : ''<CR>

"" Indentation
nnoremap <leader>i :call IndentToggle()<cr>

function! IndentToggle()
  if &expandtab
    set expandtab!
    set shiftwidth=2
  else
    set expandtab
    set shiftwidth=4
  endif
endfunction

"" Spell check
nnoremap <leader>s :set invspell<CR>
nnoremap <leader>S :set spell<bar>:set spelllang=de_de<CR>

"" Quickfix
noremap <leader>f :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
