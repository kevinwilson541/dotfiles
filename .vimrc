" start of vundle config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tshirtman/vim-cython'
Plugin 'tpope/vim-commentary.git'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'ahayman/vim-nodejs-complete'
Plugin 'vim-scripts/fu'
Plugin 'Townk/vim-autoclose'
call vundle#end()
filetype plugin indent on

" ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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
:set tabstop=4
:set expandtab
:set shiftwidth=4
:set autoindent
:set smartindent
:set cindent

" style
set background=dark
set t_Co=256
colorscheme fu
