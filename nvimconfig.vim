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

noremap <Leader>g :Goyo 60%x90%<CR>
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
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-abolish' " Fancy abbreviation replacements
Plug 'junegunn/limelight.vim' " Highlights only active paragraph
Plug 'junegunn/goyo.vim' " Full screen writing mode
Plug 'reedes/vim-lexical' " Better spellcheck mappings
Plug 'reedes/vim-litecorrect' " Better autocorrections
Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
Plug 'reedes/vim-wordy' " Weasel words and passive voice
call plug#end()

 augroup pencil
  autocmd!
  autocmd filetype markdown,mkd call pencil#init()
      \ | call lexical#init()
      \ | call litecorrect#init()
      \ | setl spell spl=en_us fdl=4 noru nonu nornu
      \ | setl fdo+=search
 augroup END
" Pencil / Writing Controls {{{
  let g:pencil#wrapModeDefault = 'soft'
  let g:pencil#textwidth = 74
  let g:pencil#joinspaces = 0
  let g:pencil#cursorwrap = 1
  let g:pencil#conceallevel = 3
  let g:pencil#concealcursor = 'c'
  let g:pencil#softDetectSample = 20
  let g:pencil#softDetectThreshold = 130
" }}}
