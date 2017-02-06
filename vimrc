filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
set nocompatible
call plug#begin('~/.vim/plugged')

" Original Github repos:
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'janko-m/vim-test'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'tpope/vim-vinegar'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-unimpaired'
" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-bundler', {'for': 'ruby'}
" JavaScript
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'moll/vim-node'
" Elixir
Plug 'elixir-lang/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'slashmili/alchemist.vim', {'for': ['elixir', 'eelixir']}
" Themes
Plug 'cocopon/iceberg.vim'
call plug#end()

call deoplete#enable()
syntax on
filetype indent plugin on
let mapleader=" "

set splitbelow
set splitright
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
set autoread
" Fat fingers
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nmap j gj
nmap k gk

" Folding
set foldmethod=indent
set nofoldenable "Don't fold by default
" Toggle fold
nnoremap <F1> za
" Open all child folds recursively
nnoremap <leader><F1> zO
" Close all folds
nnoremap <leader>0 zM

set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h14
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
set termguicolors
" Info on solarized8_dark
" https://github.com/lifepillar/vim-solarized8
colorscheme iceberg

function! ToggleBackground()
  if (g:colors_name =~# "solarized")
    exe "colors" (g:colors_name =~# "dark"
          \ ? substitute(g:colors_name, 'dark', 'light', '')
          \ : substitute(g:colors_name, 'light', 'dark', '')
          \ )
  else
    let &background = ( &background ==? "dark"? "light" : "dark" )
  endif
endfunction

nnoremap <F7> :call ToggleBackground()<CR>

let g:sparkupNextMapping = '<c-x>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:mustache_abbreviations = 1

" Move selected block up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" vim-test mappings
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>
let test#strategy = "neovim"

" Window splits
map :sp :split
map :vsp :vsplit
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

" Buffers
" See http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
nnoremap <S-H> :bprev<CR>
nnoremap <S-L> :bnext<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bq :bp <BAR> bd #<CR>

" Python autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Enable Sparkup for .eex files
autocmd FileType eelixir runtime! ftplugin/html/sparkup.vim

" Insert today’s date (human)
command! Today :normal a<c-r>=strftime('%b %d, %Y')<cr>

" Insert today’s date (ISO)
command! IsoD :normal a<c-r>=strftime('%F')<cr>

" Easy line number toggling
" See http://superuser.com/a/963845/203748
function! NumberToggle()
  :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]
endfunction

nnoremap <F2> :call NumberToggle()<CR>

" Associate .es6 with javascript filetype
au BufRead,BufNewFile *.es6 setfiletype javascript

" Shortcut to turn off search highlighting
nnoremap <CR><CR> :noh<cr>

" Tags
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_only_silent = 1
let g:ctrlp_tjump_skip_tag_name = 1
let g:ctrlp_tjump_shortener = ['/Users/jefffederman/.*/gems/', '.../']
set tags=.git/tags

" Faster CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" See
" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6#.6mrls1rvo
" See https://github.com/kien/ctrlp.vim/issues/273
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Neomake
autocmd! BufWritePost * Neomake

" Strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

