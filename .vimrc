
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/vim-auto-save'
imap <C-c> <CR><Esc>O
Plugin 'scrooloose/syntastic'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview 
Plugin 'marijnh/tern_for_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set t_Co=256
syntax on
set number
colorscheme railscasts
map <C-l> :NERDTreeTabsToggle <CR>

set mouse=a
set laststatus=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set backspace=2
let g:auto_save=1
set clipboard=unnamed
inoremap kj <ESC>
let mapleader = " "
cnoremap kj <C-C>

noremap <Leader>s :update<CR>
:autocmd InsertEnter,InsertLeave * set cul!
