" editor settings {
    filetype plugin indent on

    " set colorscheme          
    set background=dark
    if has("gui_running")
        colorscheme macvim
    endif

    " enable syntax highlighting
    syntax enable

    " disable cursor blinking
    set guicursor=a:blinkon0

    " enable backspace text deletion
    set backspace=indent,eol,start

    " use UTF-8 as character encoding
    set encoding=utf8

    " shorter messages
    set shortmess=a

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

    " cuztomize statusline (not currently customized)
    " set statusline=

    " always display status line
    set laststatus=2

    " turn on the wiLd menu
    set wildmenu

    " incrementally match search
    set incsearch

    " allows cursor to be in invalid locations
    set virtualedit=all

    " keep cursor 8 lines from top or bottom when scrolling
    set scrolloff=8

    " keep some stuff in history
    set history=100

    " show partial commands in the last line of the screen
    set showcmd

    " show line numbers
    set number

    " disable creation of swap files
    set noswapfile

    " set indentation length
    set expandtab
    set shiftwidth=4
    set softtabstop=4

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim

    " remove menu bar
    set guioptions-=m  

    " remove toolbar
    set guioptions-=T  

    " remove right-hand scroll bar
    set guioptions-=r  

    " remove left-hand scroll bar
    set guioptions-=L  

    " check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
    set autoread
    au CursorHold * checktime

" }

" keybinds {

    " map <leader> to space bar
    let mapleader = ' '
    let g:mapleader = ' '

    " move up/down
    nnoremap <up> <C-u>
    nnoremap <down> <C-d>
    nnoremap <S-l> <C-u>
    nnoremap <S-h> <C-d>

    " switch between buffers
    nnoremap <left> :bN<Enter>
    nnoremap <right> :bn<Enter>

    " move between tabs
    nnoremap <S-Left> gT
    nnoremap <S-Right> gt
    inoremap <S-Left> gT
    inoremap <S-Right> gt

    " <enter> adds new line without entering insert mode
    nnoremap <S-Enter> O<Esc>
    nnoremap <CR> o<Esc>

    " clear highlighting
    map <silent><leader>ch :noh<ENTER>

    " open .vimrc
    map <silent><leader>re :e $MYVIMRC<ENTER>  
    " refresh vim to use current .vimrc
    map <leader>rr :source $MYVIMRC<ENTER>  

    " open nerdtree
    nnoremap <leader>ne :NERDTree<cr>

    " clear ctrlp cache
    map <leader>cc :CtrlPClearCache<cr>

    " toggle tagbar
    nmap <leader>tb :TagbarToggle<CR>

" }

" plugin settings {

    " nerdtree settings
    let g:NERDTreeChDirMode = 2

    " ctrlp settings
    let g:ctrlp_working_path_mode = "rw"
    let g:ctrlp_map = '<leader>p'

    " syntastic settings
    let g:syntastic_enable_signs=1
    let g:syntastic_check_on_open = 1
    let g:syntastic_echo_current_error = 1

" }

" plugin installtion list {

    call vundle#begin()

    " handles installation of plugins
    " activate with :PluginInstall
    Plugin 'gmarik/Vundle.vim'

    " script library (dependency for certain plugins)
    " documentation at :help l9
    Plugin 'L9'

    " activate with <leader>ne
    " documentation at :help nerdtree
    Plugin 'scrooloose/nerdtree'

    " activate with <leader>p
    " documentation at :help ctrlp
    Plugin 'kien/ctrlp.vim'

    " activate with gcc (current line) and gc (visual mode)
    " documentation at :help commentary
    Plugin 'tpope/vim-commentary'

    " toggle with :GitGutterToggle
    " documentation at :help gitgutter
    Plugin 'airblade/vim-gitgutter'

    " documentation at :help syntastic
    Plugin 'scrooloose/syntastic'

    " documentation at :help surround
    Plugin 'tpope/vim-surround'

    Plugin 'tpope/vim-repeat'

    " git wrapper
    " documentation at :help fugitive
    Plugin 'tpope/vim-fugitive'

    Plugin 'tpope/vim-unimpaired'

    Plugin 'mattn/emmet-vim'

    " activate with :Ag followed by search terms
    " documentation at :help ag
    Plugin 'rking/ag.vim'

    " activate with <tab> after typing something
    " documentation at :help supertab
    Plugin 'ervandew/supertab'

    " activate with <leader>tb
    " documentation at :help tagbar
    Plugin 'majutsushi/tagbar'

    Plugin 'christoomey/vim-tmux-navigator'

    " improved statusline
    " documentation at :help Powerline
    Plugin 'Lokaltog/vim-powerline'

    " activate with <leader><leader>{command}/{motion}
    " documentation at :help easymotion
    Plugin 'Lokaltog/vim-easymotion'

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
