call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-airline/vim-airline'

Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

Plug 'octol/vim-cpp-enhanced-highlight'

"Plug 'Valloric/YouCompleteMe'
"Plug 'embear/vim-localvimrc'

Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
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

set autowrite

":set mouse=a

"" open nerdtree on start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" delete buffer for deleted files in nerdtree
let NERDTreeAutoDeleteBuffer=1

"" nerdtree style
let NERDTreeMinimalUI=1

"" gitv close all
let g:Gitv_WipeAllOnClose=0

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

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:cpp_class_decl_highlight = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Buffer nav
noremap <A-n> :bn<cr>
noremap <A-p> :bp<cr>

"" Close buffer
noremap <leader>q :BD<cr>
noremap <leader>Q :BD!<cr>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

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
