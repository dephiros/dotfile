call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'  " git diff in the 'gutter' (sign column). It shows which lines have been added, modified, or removed.
Plug 'aonemd/kuroi.vim'  "a dark theme
Plug 'sheerun/vim-polyglot'  "support over 100 languages and load them on demand
Plug 'tpope/vim-fugitive'  "a git wrapper for vim
call plug#end()

" .............................................................................
" basic
" .............................................................................
set lazyredraw                                     "lazily redraw screen while executing macros, and other commands
set ttyfast                                        "more characters will be sent to the screen for redrawing
set ttimeout                                       "time waited for key press(es) to complete...
set ttimeoutlen=50                                 " ...makes for a faster key response
set backspace=indent,eol,start                     "make backspace behave properly in insert mode
set wildmenu                                       "better menu with completion in command mode
set wildmode=longest:full,full
set scrolloff=2                                    "always show 2 lines above/below the cursor
set showcmd                                        "display incomplet coc
set cmdheight=2  " Better display for messages
set laststatus=2                                   "always display the status bar
set number                                         "display line numbers
set cursorline                                     "highlight current line
set colorcolumn=81                                 "display text width column
" indentation
set autoindent                                     "always set autoindenting on
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "use two spaces for indentation
autocmd! FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
set incsearch                                      "incremental search highlight
set ignorecase                                     "searches are case insensitive...
set smartcase                                      " ..unless they contain at least one capital letter
set hlsearch                                       "highlight search patterns

set t_Co=256                        "enable 256 colors
set background=dark
colorscheme kuroi

"status line: modifiedflag, charcount, filepercent, filepath
set statusline=%=%m\ %c\ %P\ %f
let g:netrw_browsex_viewer="open"
