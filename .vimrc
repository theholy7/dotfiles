set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
set showcmd

" Change highlighting of cursor line when entering/leaving Insert Mode
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'wakatime/vim-wakatime'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'petobens/poet-v'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/django.vim'


" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

colorscheme afterglow

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Set Backspace to work properly
set backspace=2

" Set status bar (powerline) to always show
set laststatus=2

"Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
"
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Python file settings
au BufRead,BufNewFile *.go,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufNewFile,BufRead *.py
    \ set tabstop=4| 
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=120|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|

" Yaml file settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

let python_highlight_all=1
syntax on

set nu

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" FZF buffers and Gitfiles
nmap <leader>b :Buffers<CR>
nmap <leader>f :GFiles<CR>

let g:poetv_executables = ['poetry']
let g:poetv_auto_activate = 0

" auto read files after format changes
set autoread
let &t_TI = ""
let &t_TE = ""
