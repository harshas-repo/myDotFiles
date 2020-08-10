set nocompatible
set nu
set rnu
syntax on

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set mouse+=a
set splitright
set splitbelow

inoremap {} {}<ESC>i
inoremap {<RETURN> {}<ESC>i<CR><ESC>O


nnoremap : ;
nnoremap ; :

"pluggins
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

"Airline
Plug 'vim-airline/vim-airline'

Plug 'preservim/nerdcommenter'

call plug#end()

colorscheme gruvbox
set background=dark
set termguicolors
let g:airline#extensions#tabline#enabled = 1

"leader set to space
let mapleader=" "

"source % to autoload the new vimrc
nnoremap <leader>uu :source%<CR>

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimEnter * WipeReg

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"code folding
set foldmethod=indent
set foldlevel=99

nnoremap <leader>f za

set clipboard=unnamed
set t_Co=256
set cursorline


