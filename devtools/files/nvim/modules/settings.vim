" Don't load netrw it sucks
let g:loaded_netrwPlugin = 1

" change terminal title
set title
" visible line numbers
set number
" relative line numbers
set relativenumber
" hide mode (for custom statusline)
set noshowmode
" global search by default
set gdefault
" highlight cursor line
set cursorline
" smart case when uppercase
set smartcase
" case insensitive search
set ignorecase
" allow mouse usage
set mouse=a
" highlight matching brackets
set showmatch
" jump to first non-blank character
set nostartofline
" Shorter key timeout
set timeoutlen=1000 ttimeoutlen=0
" Always set utf-8 encoding when writing
set fileencoding=utf-8
" disable wordwrap by default
set nowrap
" When wrapping, don't split words
set linebreak
" characters to use for listchars (only trailing displayed)
set listchars=tab:│\ ,trail:·
" display listchars
set list
" don't redraw on macros
set lazyredraw
" hide background buffers automatically
set hidden
" disables swap files
set noswapfile
" disables backup files
set nobackup
" disabled writing backup
set nowritebackup
" save undo between sessions in undofile
set undofile
" smarter indenting
set smartindent
" indent with spaces
set expandtab
" use 2 spaces for indentation
set shiftwidth=2

" Start scrolling near margins instead of at edge of screen
set scrolloff=8
set sidescrolloff=15
set sidescroll=5
set pyxversion=3  


" Yank to system clipboard
set clipboard=unnamedplus
