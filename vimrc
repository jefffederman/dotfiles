filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
set nocompatible
call plug#begin('~/.vim/plugged')

" My bundles here:
"
" Original Github repos:
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'bling/vim-airline'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'janko-m/vim-test'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'tpope/vim-vinegar'
Plug 'neomake/neomake'
" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-bundler', {'for': 'ruby'}
" JavaScript
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
" Elixir
Plug 'elixir-lang/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'sanmiguel/helpex.vim', {'for': ['elixir', 'eelixir']}
Plug 'Shougo/vimproc.vim', {'do': 'make'} " helpex.vim dependency
Plug 'thinca/vim-ref' " helpex.vim dependency
call plug#end()

syntax on
filetype indent plugin on
let mapleader=" "
"nmap ; :

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
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h16
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
set termguicolors
" https://github.com/lifepillar/vim-solarized8
colorscheme solarized8_dark
let g:sparkupNextMapping = '<c-x>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:mustache_abbreviations = 1

" vim-test mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "iterm"

" Window splits
map :sp :split
map :vsp :vsplit
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

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
  if(&nu == 1)
    set nu!
    set rnu
  else
    set nornu
    set nu
  endif
endfunction

nnoremap <F2> :call NumberToggle()<CR>

" Associate .es6 with javascript filetype
au BufRead,BufNewFile *.es6 setfiletype javascript

" Shortcut to turn off search highlighting
nnoremap <leader>c :nohlsearch<CR>

" Toggle between Solarized dark/light
function! ToggleSolarized()
  exe "colors" (g:colors_name =~# "dark"
        \ ? substitute(g:colors_name, 'dark', 'light', '')
        \ : substitute(g:colors_name, 'light', 'dark', '')
        \ )
endfunction

nnoremap <F7> :call ToggleSolarized()<CR>

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
