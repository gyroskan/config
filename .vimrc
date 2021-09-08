set nocompatible
filetype off
syntax on
filetype indent plugin on
set shiftwidth=4
set softtabstop=4
set expandtab
set number
" set background=dark

colorscheme virtuose

" Better auto-completion for commands
set wildmenu

" Search while typing
set incsearch


" Set visual stop column
set colorcolumn=80

" Remove trailing spaces for .c and .h files
autocmd BufWritePre *.[ch] :%s/\s\+$//e
