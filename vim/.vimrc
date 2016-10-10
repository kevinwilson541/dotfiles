" start of vundle config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Plugin 'tshirtman/vim-cython'
Plugin 'tpope/vim-commentary.git'
Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Townk/vim-autoclose'
Plugin 'jimenezrick/vimerl'
Plugin 'cocopon/iceberg.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'rust-lang/rust.vim'
" Plugin 'moll/vim-node'
call vundle#end()
filetype plugin indent on

" ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" autocmd FileType javascript setlocal omnifunc=tern#Complete

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

" style
set background=dark
set t_Co=256
colorscheme iceberg
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:Powerline_theme = "default"
let g:Powerline_colorscheme = "default"
let g:Powerline_symbols = "fancy"

inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>

nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <right> <nop>

set virtualedit=onemore
