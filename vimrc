filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
set nocompatible
call plug#begin('~/.vim/plugged')

" My bundles here:
"
" Original Github repos:
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'mustache/vim-mustache-handlebars'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'kchmck/vim-coffee-script', {'for': 'coffeescript'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'carlosgaldino/elixir-snippets', {'for': 'elixir'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'lambdatoast/elm.vim', {'for': 'elm'}

call plug#end()

syntax on
filetype indent plugin on
let mapleader=" "

set splitbelow
set splitright
set number
set modelines=0
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set encoding=utf-8
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ruler
set laststatus=2
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nmap j gj
nmap k gk
set foldmethod=indent
set nofoldenable "Don't fold by default
set t_Co=256
colorscheme solarized
set background=dark
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h16
let g:airline_powerline_fonts = 1
let g:sparkupNextMapping = '<c-x>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:mustache_abbreviations = 1

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" Window splits
map :sp :split
map :vsp :vsplit
set fillchars=""

" Python autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
