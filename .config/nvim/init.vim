call plug#begin()
  " File and buffer management
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  Plug 'w0rp/ale'
	Plug 'floobits/floobits-neovim', { 'do': ':UpdateRemotePlugins' }

  " Language Server
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" General
set nocompatible
filetype plugin indent on

" Enable syntax highlighting and setup colorscheme
syntax on
set termguicolors
set background=dark
colorscheme gruvbox

" Backup
set backupdir=~/.local/share/nvim/backup/
set directory=~/.local/share/nvim/backup/

" Line numbers
set number relativenumber
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set shiftround

" File and path autocompletion
set path+=**
set wildignore=*.o,*.pyc,*.class,*.d,*/.git/*,*/node_modules/*,.DS_Store
set wildmenu

" Enable mouse
set mouse=a
set mousehide

" Always show the status line
set laststatus=2

" Make status line informative
set ruler
set showmode
set showcmd

" vim-airline settings
let g:airline_theme = 'gruvbox'

" Toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

" deoplete settings
let g:deoplete#enable_at_startup = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }

let g:LanguageClient_serverCommands = { 
      \ 'javascript': ['javascript-typescript-stdio'],
      \ }

" LanguageClient keybindings
nnoremap <CR> :call LanguageClient_textDocument_hover()<CR>
nnoremap <leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <leader>lf :call LanguageClient_textDocument_formatting()<CR>
nnoremap <leader>lrr :call LanguageClient_textDocument_rename()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lrf :call LanguageClient_textDocument_references()<CR>
nnoremap <leader>lws :call LanguageClient_textDocument_workspace_symbol()<CR>
