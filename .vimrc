" - - - - - - - - - - EDITOR SETTINGS - - - - - - - - - - "

    " set colorscheme
    set background=dark
    if has("gui_running")
        colorscheme macvim
    endif

    " set default working directory
    cd $HOME/workspace

    " enable filetype plugins
    filetype plugin on
    filetype indent on

    " enable syntax highlighting
    syntax enable

    " cuztomize statusline (not currently customized)
    " set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

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

    " show line numbers
    set number

    " enable backspace text deletion
    set backspace=indent,eol,start

    " enable folding
    set foldenable

    " use UTF-8 as character encoding
    set encoding=utf8

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

    " disable creation of swap files
    set noswapfile

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim

    " check file change every 4 seconds and reload the buffer upon detecting change
    set autoread
    au CursorHold * checktime

    " return to last edit position when opening files
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    " remember info about open buffers on close
    set viminfo^=%


" - - - - - - - - - - PLUGIN SETTINGS - - - - - - - - - - "

    " nerdtree
    let g:NERDTreeChDirMode = 2
    let NERDTreeShowHidden=1

    " ctrlp
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " syntastic
    let g:syntastic_check_on_open = 1
    let g:syntastic_echo_current_error = 1

" - - - - - - - - - -  KEY BINDINGS - - - - - - - - - - "

    " map <leader> to space bar
    let mapleader = ' '
    let g:mapleader = ' '

    " quick save
    noremap <leader><leader>w :w<CR>

    " move up/down
    noremap <S-k> <C-u>
    noremap <S-j> <C-d>

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
    noremap <leader>db :Bclose<CR>

    " switch CWD to the directory of the open buffer
    noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

    " split window
    noremap <S-Up> <C-w>v
    noremap <S-Down> <C-w>s
    " move between splits
    noremap <S-Tab> <C-w><C-w>

    " add new line without entering insert mode
    noremap <S-Enter> O<Esc>
    noremap <CR> o<Esc>

    " delete line in insert mode
    inoremap <C-d> <Esc>ddi

    " search for the current selection with * or #
    vnoremap <silent> * :call VisualSelection('f')<CR>*
    vnoremap <silent> # :call VisualSelection('b')<CR>#

    " search and replace the current selection with <leader>r
    vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

    " clear highlighting
    map <silent><leader>ch :noh<CR>

    " open .vimrc
    nnoremap <silent><leader><leader>e :e $MYVIMRC<CR>
    " refresh vim to use current .vimrc
    map <leader><leader>r :source $MYVIMRC<CR><leader>ch

    " open/close quickfix
    noremap <leader>co :copen<CR>
    noremap <leader>cc :cclose<CR>
    " open nerdtree
    noremap <leader>nt :NERDTreeToggle<CR>

    " open ctrlp
    let g:ctrlp_map = '<leader>p'
    " clear ctrlp cache
    noremap <leader>cp :CtrlPClearCache<CR>

    " activate easymotion
    noremap <leader> <Plug>(easymotion-prefix)

    " activate emmet
    inoremap <C-e> <C-y>,

    " toggle tagbar
    noremap <leader>tb :TagbarToggle<CR>

    " remove trailing whitespace
    noremap <leader>fw :FixWhitespace<CR>

    " toggle gundo
    noremap <leader>gu :GundoToggle<CR>

" - - - - - - - - - - FUNCTIONS - - - - - - - - - - "

    function! CmdLine(str)
        exe "menu Foo.Bar :" . a:str
        emenu Foo.Bar
        unmenu Foo
        endfunction

    function! VisualSelection(direction) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction

    " returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        en
        return ''
    endfunction

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


" - - - - - - - - - - PLUGIN LIST - - - - - - - - - - "

    call vundle#begin()

    " handles installation of plugins
    " activate with :PluginInstall
    " documentation at :help vundle
    Plugin 'gmarik/Vundle.vim'


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
    " activate with <leader>nt
    " documentation at :help nerdtree
    Plugin 'scrooloose/nerdtree'

    " fuzzy finder
    " activate with <leader>p
    " documentation at :help ctrlp
    Plugin 'kien/ctrlp.vim'

    " search tool
    " activate with :Ag followed by search terms
    " documentation at :help ag
    Plugin 'rking/ag.vim'

    " enables fast line navigation
    " activate with <leader>{command}/{motion}
    " documentation at :help easymotion
    Plugin 'Lokaltog/vim-easymotion'

    " enables fast coding of markup languages
    " documentation at :help emmet
    Plugin 'mattn/emmet-vim'

    " enables fast commenting
    " activate with gcc for current line, gc for visual mode
    " documentation at :help commentary
    Plugin 'tpope/vim-commentary'

    " enables insert completion
    " activate with <tab> after typing something
    " documentation at :help supertab
    Plugin 'ervandew/supertab'

    " enables browsing of tags
    " activate with <leader>tb
    " documentation at :help tagbar
    Plugin 'majutsushi/tagbar'

    " enables fast adding, changing, and deleting of surrounding characters
    " documentation at :help sandwich
    Plugin 'machakann/vim-sandwich'

    " enables removing trailing whitespace
    " activate with <leader>fw
    Plugin 'bronson/vim-trailing-whitespace'

    " handles automatic closing of character pairs
    Plugin 'Townk/vim-autoclose'

    " enables undo tree visualization
    " activate with <leader>gu
    " documentation at :help gundo
    Plugin 'sjl/gundo.vim'

    " expanded repeating functionality with
    " activate with .
    Plugin 'tpope/vim-repeat'

    " expanded matching functionality
    " activate with %
    " documentation at :help matchit
    Plugin 'tmhedberg/matchit'

    " enables use of snippets
    " documetation at :help snipmate
    Plugin 'garbas/vim-snipmate'

    " enables deleting all buffers except current one
    " activate with :BufOnly
    Bundle 'schickling/vim-bufonly'

    " utility libraries
    Plugin 'MarcWeber/vim-addon-mw-utils'
    " documentation at :help tlib
    Plugin 'tomtom/tlib_vim'
    " documentation at :help l9
    Plugin 'L9'

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
    Plugin 'w0ng/vim-hybrid'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'nanotech/jellybeans.vim'
    Plugin 'altercation/vim-colors-solarized'

    call vundle#end()
