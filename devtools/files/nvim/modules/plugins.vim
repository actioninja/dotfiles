if has('win32')
  let configdir = '$LOCALAPPDATA/nvim/plugged'
else
  let configdir = '~/.config/nvim/plugged'
endif

call plug#begin(configdir)

Plug 'cocopon/iceberg.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

Plug 'sheerun/vim-polyglot'

Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'cohama/lexima.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
