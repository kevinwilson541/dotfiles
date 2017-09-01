" start of vundle config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-commentary.git'
Plugin 'scrooloose/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Townk/vim-autoclose'
Plugin 'jimenezrick/vimerl'
Plugin 'cocopon/iceberg.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'ervandew/supertab'
call vundle#end()
filetype plugin indent on

Bundle "daylerees/colour-schemes", { "rtp": "vim/" }

" supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" automatically close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python

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

let g:Powerline_theme = "default"
let g:Powerline_colorscheme = "default"
let g:Powerline_symbols = "unicode"

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
let g:racer_cmd = "/usr/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" syntastic config
" let g:syntastic_javascript_checkers=['eslint']
