" editor settings {

    " enable filetype detection and some other stuff...
    filetype plugin indent on

    " set colorscheme
    set background=dark
    if has("gui_running")
        colorscheme macvim
    endif

    " cuztomize statusline (not currently customized)
    " set statusline=

    " remove menu bar
    set guioptions-=m
    " remove toolbar
    set guioptions-=T
    " remove right-hand scroll bar
    set guioptions-=r
    " remove left-hand scroll bar
    set guioptions-=L
    " disable cursor blinking
    "
    set guicursor=a:blinkon0

    " set indentation length
    set expandtab
    set shiftwidth=4
    set softtabstop=4

    " enable syntax highlighting
    syntax enable

    " show line numbers
    set number

    " enable backspace text deletion
    set backspace=indent,eol,start

    " use UTF-8 as character encoding
    set encoding=utf8

    " shorter messages
    set shortmess=a

    " incrementally match search
    set incsearch

    " highlight search results
    set hlsearch

    " when searching try to be smart about cases
    set smartcase

    " ignore case when searching
    set ignorecase

    " disable error sound
    set noerrorbells

    " disable visual bell
    set t_vb=

    " always display status line
    set laststatus=2

    " turn on the wiLd menu
    set wildmenu

    " allows cursor to be in invalid locations
    set virtualedit=all

    " keep cursor 8 lines from top or bottom when scrolling
    set scrolloff=8

    " keep some stuff in history
    set history=100

    " show partial commands in the last line of the screen
    set showcmd

    " disable creation of swap files
    set noswapfile

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim

    " check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
    set autoread
    au CursorHold * checktime

" }

" keybinds {

    " map <leader> to space bar
    let mapleader = ' '
    let g:mapleader = ' '

    " move up/down
    map <S-l> <C-u>
    map <S-h> <C-d>

    " move between tabs
    map <S-Left> gT
    map <S-Right> gt

    " list buffers
    map <up> :ls<cr>
    " switch between buffers
    map <down> :e#<cr>
    map <left> :bN<cr>
    map <right> :bn<cr>

    " split window
    map <S-Up> <C-w>v
    map <S-Down> <C-w>s
    " move between splits
    map <S-Tab> <C-w><C-w>

    " <enter> adds new line without entering insert mode
    map <S-Enter> O<Esc>
    map <CR> o<Esc>

    " clear highlighting
    map <silent><leader>ch :noh<cr>

    " open .vimrc
    map <silent><leader>re :e $MYVIMRC<cr>
    " refresh vim to use current .vimrc
    map <leader>rr :source $MYVIMRC<cr><leader>ch

    " open/close quickfix
    map <leader>co :copen<cr>
    map <leader>cc :cclose<cr>
    " open nerdtree
    map <leader>ne :NERDTree<cr>

    " open ctrlp
    let g:ctrlp_map = '<leader>p'
    " clear ctrlp cache
    map <leader>cp :CtrlPClearCache<cr>

    " activate easymotion
    map <leader> <Plug>(easymotion-prefix)

    " activate emmet
    imap <S-Tab> <C-y>,
    " toggle tagbar
    map <leader>tb :TagbarToggle<cr>
    " remove trailing whitespace
    map <leader>fw :FixWhitespace<cr>

" }

" plugin settings {

    " nerdtree
    let g:NERDTreeChDirMode = 2

    " ctrlp
    let g:ctrlp_working_path_mode = "rw"

    " syntastic
    let g:syntastic_check_on_open = 1
    let g:syntastic_echo_current_error = 1

" }

" plugin installtion list {

    call vundle#begin()

    " handles installation of plugins
    " activate with :PluginInstall
    " documentation at :help vundle
    Plugin 'gmarik/Vundle.vim'

    " script library (dependency for certain plugins)
    " documentation at :help l9
    Plugin 'L9'

    " handles syntax checking
    " documentation at :help syntastic
    Plugin 'scrooloose/syntastic'

    " improved statusline
    " documentation at :help Powerline
    Plugin 'Lokaltog/vim-powerline'

    " displays git diff in sidebar
    " toggle with :GitGutterToggle
    " documentation at :help gitgutter
    Plugin 'airblade/vim-gitgutter'

    " git wrapper
    " documentation at :help fugitive
    Plugin 'tpope/vim-fugitive'

    " file tree explorer
    " activate with <leader>ne
    " documentation at :help nerdtree
    Plugin 'scrooloose/nerdtree'

    " Fuzzy finder
    " activate with <leader>p
    " documentation at :help ctrlp
    Plugin 'kien/ctrlp.vim'

    " search tool
    " activate with :Ag followed by search terms
    " documentation at :help ag
    Plugin 'rking/ag.vim'

    " enables easy line navigation
    " activate with <leader>{command}/{motion}
    " documentation at :help easymotion
    Plugin 'Lokaltog/vim-easymotion'

    " enables fast coding of markup languages
    " documentation at :help emmet
    Plugin 'mattn/emmet-vim'

    " enables easy commenting
    " activate with gcc for current line, gc for visual mode
    " documentation at :help commentary
    Plugin 'tpope/vim-commentary'

    " enables insert completion
    " activate with <tab> after typing something
    " documentation at :help supertab
    Plugin 'ervandew/supertab'

    " activate with <leader>tb
    " documentation at :help tagbar
    Plugin 'majutsushi/tagbar'

    " expanded repeat functionality
    Plugin 'tpope/vim-repeat'

    " enables removing trailing whitespace
    " activate with <leader>fw
    Plugin 'bronson/vim-trailing-whitespace'

    " handles automatic closing of character pairs
    Plugin 'Townk/vim-autoclose'

    " compatibility improvements
    Plugin 'othree/html5.vim'
    Plugin 'tpope/vim-haml'
    Plugin 'slim-template/vim-slim'
    Plugin 'cakebaker/scss-syntax.vim'
    Plugin 'pangloss/vim-javascript'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'elzr/vim-json'
    " documentation at :help pymode
    Plugin 'klen/python-mode'
    Plugin 'vim-ruby/vim-ruby'
    " documentation at :help rails
    Plugin 'tpope/vim-rails'

    " colorschemes
    Plugin 'flazz/vim-colorschemes'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'w0ng/vim-hybrid'

    call vundle#end()

" }
