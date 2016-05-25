" - - - - - - - - - - EDITOR SETTINGS - - - - - - - - - - "

" disable compatibility mode
set nocompatible

" enable filetype plugins
filetype plugin indent on

" set colorscheme
 set background=dark
if has("gui_running")
 colorscheme macvim
endif

" set default working directory
cd $HOME

" enable syntax highlighting
syntax enable

" remove menu bar
set guioptions-=m

" remove toolbar
set guioptions-=T

" remove right-hand scroll bar
set guioptions-=r

" remove left-hand scroll bar
set guioptions-=L

" disable cursor blinking
set guicursor=a:blinkon0

" tab settings
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" indentation settings
set autoindent
set smartindent

" show document line number at current line.
set number

" use relative line numbers
set relativenumber

" enable backspace text deletion
set backspace=indent,eol,start

" enable folding
set foldenable

" use UTF-8 as character encoding
set encoding=utf8

" disable swap files
set noswapfile

" shorter messages
set shortmess=a

" incrementally match search
set incsearch

" highlight search results
set hlsearch

" ignore case when searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" don't redraw while executing macros
set lazyredraw

" disable error sound
set noerrorbells

" disable visual bell
set t_vb=

" always display status line
set laststatus=2

" disable concealment of quotation marks
set conceallevel=0

" turn on the wiLd menu
set wildmenu

" allows cursor to be in invalid locations
set virtualedit=all

" keep cursor 5 lines from top or bottom when scrolling
set scrolloff=5

" keep some stuff in history
set history=500

" show partial commands in the last line of the screen
set showcmd

" remember info about open buffers on close
set viminfo^=%

" check file change every 4 seconds and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" - - - - - - - - - - PLUGIN SETTINGS - - - - - - - - - - "

" nerdtree
let g:NERDTreeChDirMode = 2
let NERDTreeShowHidden=1

" ctrlp
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1

" - - - - - - - - - -  KEY BINDINGS - - - - - - - - - - "

" map <leader> to space bar
let mapleader = ' '
let g:mapleader = ' '

" don't skip wrapped lines
noremap j gj
noremap k gk

" quick save (force)
noremap <leader><leader>w :w!<CR>

" move up/down
noremap <S-k> 5k
noremap <S-j> 5j
noremap <leader><S-j> 25j
noremap <leader><S-k> 25k

" move to far left/right
noremap <S-l> $
noremap <S-h> 0

" move between tabs
noremap <S-Left> gT
noremap <S-Right> gt

" list buffers
noremap <Up> :ls<CR>

" switch between buffers
noremap <Down> :e#<CR>
noremap <Left> :bN<CR>
noremap <Right> :bn<CR>

" close the current buffer
noremap <leader>bc :Bclose<CR>

" switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" split window
noremap <S-Up> <C-w>v
noremap <S-Down> <C-w>s
" move between splits
noremap <S-Tab> <C-w><C-w>

" prevent commented lines from adding comment character to new line
"map O O<Esc>Xxi
map o o<Esc>Xxi

" add new line without entering insert mode
map <S-CR> O<Esc>
map <CR> o<Esc>

" add new line above cursor
inoremap <S-Enter> <Esc>O

" delete line in insert mode
inoremap <C-d> <Esc>ddi

" undo in insert mode
inoremap <C-u> <Esc>ui

" redo in insert mode
inoremap <C-r> <Esc><C-r>i

" open .vimrc in new tab
nnoremap <silent><leader><leader>e :tabe $MYVIMRC<CR>
" refresh vim to use current .vimrc
map <silent><leader><leader>r :source $MYVIMRC<CR><leader>ch

" clear highlighting
map <silent><leader>ch :noh<CR>

" open/close quickfix
noremap <silent><leader>co :copen<CR>
noremap <silent><leader>cc :cclose<CR>
" open nerdtree
noremap <silent><leader>nt :NERDTreeToggle<CR>

" activate ctrlp
let g:ctrlp_map = '<leader>p'
" clear ctrlp cache
noremap <silent><leader>cp :CtrlPClearCache<CR>

" activate easymotion
map <silent><leader> <Plug>(easymotion-prefix)

" activate emmet
imap <C-j> <C-y>,
" toggle tagbar

noremap <silent><leader>tb :TagbarToggle<CR>

" remove trailing whitespace
noremap <silent><leader>fw :FixWhitespace<CR>

" toggle gundo
noremap <silent><leader>gu :GundoToggle<CR>

" - - - - - - - - - - FUNCTIONS - - - - - - - - - - "

" don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" clear all registers
function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearRegisters call ClearRegisters()


" - - - - - - - - - - PLUGIN LIST - - - - - - - - - - "
>>>>>>> 0583fb0c55731d90700243e8ac12d21d41cbd3a4

" set the runtime path to include Vundle and initialize
if has("win32")
    set rtp+=~/_vim/bundle/Vundle.vim
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif

call vundle#begin()

" handles installation of plugins
" activate with :PluginInstall
 Plugin 'VundleVim/Vundle.vim'

" displays git diff in sidebar
" toggle with :GitGutterToggle
Plugin 'airblade/vim-gitgutter'

" file tree explorer
" activate with <leader>nt
Plugin 'scrooloose/nerdtree'

" fuzzy finder
" activate with <leader>p
Plugin 'kien/ctrlp.vim'

" search tool
" activate with :Ag followed by search terms
Plugin 'rking/ag.vim'

" enables fast line navigation
" activate with <leader>{command}/{motion}
Plugin 'Lokaltog/vim-easymotion'

" enables fast commenting
" activate with gcc for current line, gc for visual mode
Plugin 'tpope/vim-commentary'

" enables insert completion
" activate with <tab> after typing something
Plugin 'ervandew/supertab'

" enables browsing of tags
" activate with <leader>tb
Plugin 'majutsushi/tagbar'

" enables removing trailing whitespace
" activate with <leader>fw
Plugin 'bronson/vim-trailing-whitespace'

" expanded repeating functionality with
" activate with .
Plugin 'tpope/vim-repeat'

" expanded matching functionality
" activate with %
Plugin 'tmhedberg/matchit'

" enables deleting all buffers except current one
" activate with :BufOnly
Bundle 'schickling/vim-bufonly'

" enables fast coding of markup languages
" activate with <C-j>
Plugin 'mattn/emmet-vim'

" git wrapper
Plugin 'tpope/vim-fugitive'

" improved statusline
Plugin 'Lokaltog/vim-powerline'

" handles syntax checking
Plugin 'scrooloose/syntastic'

" handles error detection in javascript code
Plugin 'Shutnik/jshint2.vim'

" handles automatic closing of character pairs
Plugin 'Townk/vim-autoclose'

" enables fast adding, changing, and deleting of surrounding characters
Plugin 'machakann/vim-sandwich'

" colorschemes
Plugin 'w0ng/vim-hybrid'
Plugin 'flazz/vim-colorschemes'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'

" utility libraries
Plugin 'L9'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'

" compatibility improvements
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'othree/html5.vim'
Plugin 'klen/python-mode'
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()
