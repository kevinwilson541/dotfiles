" start of vundle config
set nocompatible
call plug#begin('~/.vim/plugged')
" Edit
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale', {'for': ['javascript', 'rust']}
Plug 'pangloss/vim-javascript'
Plug 'Townk/vim-autoclose'
Plug 'vim-airline/vim-airline'
Plug 'jimenezrick/vimerl'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/rust-doc.vim'
Plug 'ervandew/supertab'

" Nav
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'

" Theme
Plug 'cocopon/iceberg.vim'
call plug#end()
filetype plugin indent on

" supertab
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

" automatically close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" for numbered lines
:set number

" syntax highlighting
:syntax enable
:filetype plugin on

" for indenting
:set tabstop=2
:set expandtab
:set shiftwidth=2
:set autoindent
:set smartindent
:set cindent

" ignore rust.vim settings for indentation
let g:rust_recommended_style = 0

" style
set background=dark
set t_Co=256
colorscheme iceberg

inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>

nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <right> <nop>

set virtualedit=onemore

" omnicompletion
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

:set completeopt=longest,menuone

" racer-vim
set hidden
let g:racer_cmd = '/usr/bin/racer'
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" ale config
let g:ale_linters = {'rust': ['cargo'], 'javascript': ['jshint']}
let g:ale_rust_cargo_use_check = 1
let g:ale_lint_on_text_changed = 'never'
