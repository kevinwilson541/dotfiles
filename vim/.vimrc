" start of vundle config
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-commentary.git'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Townk/vim-autoclose'
Plugin 'jimenezrick/vimerl'
Plugin 'cocopon/iceberg.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'rust-lang/rust.vim'
call vundle#end()
filetype plugin indent on

Bundle "daylerees/colour-schemes", { "rtp": "vim/" }

" ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_filetype_whitelist = {"python": 1, "erlang": 1, "rust": 1}
let g:ycm_rust_src_path = '/home/kevin/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/src/src'

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
" if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
"   \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
"   " Use the guicolorscheme plugin to makes 256-color or 88-color
"   " terminal use GUI colors rather than cterm colors.
"   runtime! plugin/guicolorscheme.vim
"   GuiColorScheme iceberg
" endif
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

" omnicompletion
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

:set completeopt=longest,menuone
autocmd BufRead,BufNewFile *.py set omnifunc=pythoncomplete#Complete

function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    if &omnifunc != ''
      return "\<C-X>\<C-O>"
    elseif &dictionary != ''
      return "\<C-K>"
    else
      return "\<C-N>"
    endif
  endif
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>

" syntastic config
" let g:syntastic_javascript_checkers=['eslint']
