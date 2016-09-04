
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'

Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'

Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'

call vundle#end()

set nocompatible                " be iMproved, required
filetype off                    " required

filetype plugin indent on       " required

"
"" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
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

" airline settings
set laststatus=2
let g:airline_powerline_fonts=1 " requires powerline fonts, see https://github.com/powerline/fonts
let g:airline_theme='base16'    " also nice: bubblegum
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline
set incsearch                   " Shows the match while typing
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

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" setup style
syntax enable
let base16colorspace=256        " Access colors present in 256 colorspace
set background=dark             " Dark backgroung, no suprise.
colorscheme base16-default-dark " see base16-vim
set t_Co=256

" use ag instead of ack (if installed)
if executable('ag')
	let g:ackprg='ag --vimgrep'
endif

" Key mappings
map <F2> :NERDTreeToggle<CR>
