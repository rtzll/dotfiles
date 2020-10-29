let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" pretty
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

"" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set cursorline                  " Highlight current line

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set hidden
set nowrap

set noshowmatch                 " Do not show matching brackets by flickering
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
set ttymouse=xterm2
set ttyscroll=3
set lazyredraw          	    " Wait to redraw

" speed up syntax highlighting
syntax sync minlines=256
set synmaxcol=300
set re=1

" setup style
syntax enable
let base16colorspace=256        " Access colors present in 256 colorspace
set background=dark             " Dark backgroung, no suprise.
colorscheme base16-default-dark " see base16-vim
set t_Co=256

" Key mappings
map <F2> :NERDTreeToggle<CR>
