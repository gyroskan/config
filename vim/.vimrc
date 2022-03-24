set nocompatible
filetype off
syntax on
filetype indent plugin on
set shiftwidth=4
set softtabstop=4
set expandtab
set number
" set background=dark

" Better auto-completion for commands
set wildmenu

" Search while typing
set incsearch


" Set visual stop column
set colorcolumn=80

" Remove trailing spaces for .c and .h files
autocmd BufWritePre *.[ch] :%s/\s\+$//e

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins part
call plug#begin('~/.vim/plugged')
" Plug 'dylanaraps/wal.vim'

Plug 'vim-airline/vim-airline'
" Plug 'valloric/youcompleteme'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/aftersyntaxc.vim'
Plug 'isobit/vim-caddyfile'
Plug 'LnL7/vim-nix'

call plug#end()

" NERDtree bindings
nnoremap <C-o> :NERDTreeToggle<CR>


" colorscheme wal
colorscheme virtuose

" Enable use of mouse
set mouse=a

set splitbelow
set splitright
