" -------- VUNDLE --------
set nocompatible              " be iMproved, required
filetype off                  " required
""" Automatically setting up Vundle, taken from
""" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{
let has_vundle=1
if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p $HOME/dotfiles/vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim $HOME/dotfiles/vim/bundle/Vundle.vim
    let has_vundle=0
endif
""" }}}
""" Initialize Vundle {{{
filetype off                                " required to init
set rtp+=$HOME/.vim/bundle/Vundle.vim       " include vundle
call vundle#begin()                         " init vundle
""" }}}
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" org mode for vim
Plugin  'jceb/vim-orgmode'
Plugin  'tpope/vim-speeddating'

" fuzzy file search
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Type \d in order to toggle the NERDTree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"tmux swithcing
Plugin 'christoomey/vim-tmux-navigator'

" Track the engine.
Plugin 'SirVer/ultisnips'
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<c-j>"
 let g:UltiSnipsJumpBackwardTrigger="<c-k>"
 " let g:UltiSnipsNoPythonWarning = 1
 " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"

" automatic closing of quotes and such
Plugin 'Raimondi/delimitMate'

" comment stuff out"
Plugin 'tpope/vim-commentary'

"surround things"
Plugin 'tpope/vim-surround'

"index search"
Plugin 'henrik/vim-indexed-search'
let g:indexed_search_numbered_only = 1

" colorscheme
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" install plugin first time
if has_vundle == 0
    :silent! PluginInstall
    :qa
endif
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" -------- VUNDLE --------
"
"
" ctrp config
let g:ctrlp_working_path_mode = 'ra'

" Customization
let g:email = "dephiros@gmail.com"
let g:user = "An Nguyen"
let g:templates_directory = '~/.vim_templates'
" Vimdiff wrap
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

runtime! ftplugin/man.vim " activate vim built in plugin man
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set number
" Toggle paste mode with f2
set pastetoggle=<F2>
syntax on
set background=light
colorscheme solarized
" fix problem with backspace
set backspace=indent,eol,start
" display status line in vim with some options
set laststatus=2
set statusline=%F%m%r%h%w\
set statusline+=%{fugitive#statusline()}\
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L]
" Turn off auto wrapping but enable visual wrap
set wrap linebreak textwidth=0
autocmd Syntax gitcommit setlocal textwidth=0
"nvim
if !has('nvim')
    set ttymouse=xterm2
endif
" fix crontab problem
au FileType crontab setlocal bkc=yes
