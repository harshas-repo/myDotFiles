"Sourcing other plugin configurations
source $HOME/.config/nvim/plug-config/coc.vim

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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300                      " Faster completion

inoremap {} {}<ESC>i
inoremap {<RETURN> {}<ESC>i<CR><ESC>O


nnoremap : ;
nnoremap ; :

"pluggins
call plug#begin('~/.vim/plugged')

"conquerer of completion autocomplete similar to vscode 'language server
"protocol support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'gruvbox-community/gruvbox'

"Airline
Plug 'vim-airline/vim-airline'

"commentor
Plug 'preservim/nerdcommenter'

"floaterm pretty cool floating terminal
Plug 'voldikss/vim-floaterm'


call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
set background=dark
set termguicolors
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1

"leader set to space
let mapleader=" "

"source % to autoload the new vimrc
nnoremap <leader>so :source%<CR>

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimEnter * WipeReg

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"code folding
set foldmethod=indent
set foldlevel=99

nnoremap <C-f> za

set clipboard=unnamed
set t_Co=256
set cursorline

"split widow resizin:
nnoremap + :vertical resize +5<CR>
nnoremap _ :vertical resize -5<CR>
nnoremap <F10> :resize -5<CR>
nnoremap <F9> :resize +5<CR>

"just to trim all the unnecessary whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'  }}

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"just defining how the comment should be in json
 autocmd FileType json syntax match Comment +\/\/.\+$+


 " Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md *.txt setlocal spell
augroup END


"floaterm config
nnoremap <leader>h :FloatermNew<CR>
"To open as a pop up
" Floaterm
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

nnoremap <leader>hh :FloatermNew --wintype=normal --height=12<CR>

"To open terminal from the bottom

tnoremap <C-q><C-q> <C-\><C-n>:q<CR>
"To exit from the floatterm, I mean to close the term buffer 

tnoremap <C-q> <C-\><C-n>
"To exit terminal mode 

"buffer management
nnoremap <leader>bb :bnext<CR>
nnoremap <leader>bn :bprevious<CR>
nnoremap <leader>bk :bp\|bd # <CR>

"Coc-Explorer
nnoremap <space>oe :CocCommand explorer<CR>
