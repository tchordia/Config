let mapleader = " "

set title
set mouse=a
set laststatus=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set backspace=2
let g:auto_save=1
set clipboard=unnamed
let mapleader = " "
let g:startify_session_persistence = 1
let g:startify_session_sort = 1

noremap <Leader>pi :PlugInstall<CR>
noremap <Leader>s :update<CR>
noremap <Leader>q :SClose<CR>
noremap <Leader>o :Startify<CR>
cnoremap kj <C-C>
inoremap kj <ESC>
:tnoremap <Esc> <C-\><C-n>
:tnoremap kj <C-\><C-n>

" Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split logic
set splitbelow
set splitright

" Creating splits
noremap <Leader>t :vsp term://bash<CR>

" To simulate |i_CTRL-R| in terminal-mode:
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
call plug#end()

