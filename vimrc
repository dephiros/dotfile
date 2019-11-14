call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  "fuzzy search support c-p plus tag
Plug 'tpope/vim-fugitive'  "a git wrapper for vim
Plug 'airblade/vim-gitgutter'  " git diff in the 'gutter' (sign column). It shows which lines have been added, modified, or removed.
Plug 'aonemd/kuroi.vim'  "a dark theme
Plug 'mattn/emmet-vim'  "
Plug 'ludovicchabant/vim-gutentags'  " auto generate tag
Plug 'sheerun/vim-polyglot'  "support over 100 languages and load them on demand
Plug 'dense-analysis/ale'  " support linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Coc is an intellisense engine for Vim/Neovim with language server support
call plug#end()

set lazyredraw                                     "lazily redraw screen while executing macros, and other commands
set ttyfast                                        "more characters will be sent to the screen for redrawing
set ttimeout                                       "time waited for key press(es) to complete...
set ttimeoutlen=50                                 " ...makes for a faster key response
set backspace=indent,eol,start                     "make backspace behave properly in insert mode
set wildmenu                                       "better menu with completion in command mode
set wildmode=longest:full,full
set completeopt=longest,menuone,preview            "better insert mode completions
set scrolloff=2                                    "always show 2 lines above/below the cursor
set showcmd                                        "display incomplet coc
set cmdheight=2  " Better display for messages
set laststatus=2                                   "always display the status bar
set number                                         "display line numbers
set cursorline                                     "highlight current line
set colorcolumn=81                                 "display text width column
set autoindent                                     "always set autoindenting on
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "use two spaces for indentation
set incsearch                                      "incremental search highlight
set ignorecase                                     "searches are case insensitive...
set smartcase                                      " ..unless they contain at least one capital letter
set hlsearch                                       "highlight search patterns
set hidden  " needed for coc. pening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
" Some servers have issues with backup files coc
set nobackup
set nowritebackup

autocmd! FileType make setlocal ts=4 sts=4 sw=4 noexpandtab

set t_Co=256                        "enable 256 colors
set background=dark
colorscheme kuroi

"status line: modifiedflag, charcount, filepercent, filepath
set statusline=%=%m\ %c\ %P\ %f

"remove trailing whitespace on save
autocmd! BufWritePre * :%s/\s\+$//e

"The Leader
let mapleader="\<Space>"

"remove search highlight
nmap <leader>q :nohlsearch<CR>

"fzf
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <leader>o :Lines<cr>
nnoremap <Leader>t :BTags<CR>
nnoremap <leader>T :Tags<cr>

"Ctags
set tags+=.git/tags
nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --extra=+f --exclude=.git,pkg --languages=-sql<cr><cr>
