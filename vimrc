filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" My bundles here:
"
" Original Github repos:
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'carlosgaldino/elixir-snippets'

call vundle#end()

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

" Python autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
