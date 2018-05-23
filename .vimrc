" vimrc - e560 - avivace

set nocompatible              " be iMproved, required
filetype off                  " required

" vim plug
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'chrisbra/Colorizer'
  Plug 'scrooloose/nerdtree'
  Plug 'crusoexia/vim-monokai'
  Plug 'godlygeek/tabular'
  Plug 'ConradIrwin/vim-bracketed-paste/'
  Plug 'mxw/vim-jsx'
  Plug 'fatih/vim-go'
  Plug 'morhetz/gruvbox'
  Plug 'vim-syntastic/syntastic'
  Plug 'neovimhaskell/haskell-vim'
  Plug 'eagletmt/ghcmod-vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'tpope/vim-repeat'
  Plug 'mtscout6/syntastic-local-eslint.vim'
  Plug 'lyokha/vim-xkbswitch'
call plug#end()

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

set clipboard=unnamed

" color scheme
syntax on
set termguicolors
" colorscheme monokai
" this option should  be before colorscheme
let g:gruvbox_italic=1
colorscheme gruvbox
set t_Co=256

function! s:SwitchPSCStyle()
  if &background == 'dark'
    set background=light
  else
    set background=dark
  endif
endfunction
nnoremap <silent> <F6> :call <SID>SwitchPSCStyle()<CR>
" set background=dark

" powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" show powerline:
set laststatus=2

" .pl for prolog, not perl
au BufRead,BufNewFile *.pl set filetype=prolog

" jj brings you the normal mode
:imap jj <Esc>

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Code readability
set relativenumber
set colorcolumn=80
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber 

" Disable BCE
if &term =~ '256color'
  set t_ut=
endif

set updatetime=250

" NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Vim jsx
let g:jsx_ext_required = 0

" Vim-go
let g:go_fmt_command = "goimports"

" Syntastic
"let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Haskell vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" xkbswitch
let g:XkbSwitchEnabled = 1 

" nerd tree
map <F1> :NERDTreeToggle<CR>
