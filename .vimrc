" basics settings
set nocompatible
set encoding=utf-8
syntax on
filetype plugin indent on
set number
set ruler
set nowrap
set shiftwidth=4
set shiftround
set tabstop=4
set expandtab
set autoindent
set smartindent
set visualbell
set noerrorbells
set ttyfast
set lazyredraw
set hidden
set showcmd
set wildmenu
set wildmode=list:longest
set shortmess=astT

" faster scroll
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
set scrolloff=3

" don't backup 
set nobackup 
set nowritebackup
set noswapfile

" search settings
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" toggles
nnoremap <leader>c :set cursorline! cursorline?<CR>
nnoremap <leader>h :set hlsearch! hlsearch?<CR>
nnoremap <leader>s :set nolist! nolist?<CR>
nnoremap <leader>r :if &guioptions=~#'r'<Bar>set guioptions-=r<Bar>else<Bar>set guioptions+=r<Bar>endif<CR>

" whitespace chars
set listchars=tab:▸\ ,eol:¬,precedes:>,extends:<,nbsp:.,trail:.

" quick cmd mode
nnoremap ; :

" gui
if has("gui_running")
  set guioptions-=T
  set guioptions-=L
  set showtabline=1
  colorscheme ir_black
  set bg=dark
  if has("gui_macvim")
		"set guifont=monaco:h10
		"set noantialias
    set fuopt=maxvert,maxhorz     
  endif
endif

" plugins 
nnoremap <leader>f :FufFile<CR>
nnoremap <leader>b :FufBuffer<CR>
nnoremap <leader>d :FufDir<CR>
