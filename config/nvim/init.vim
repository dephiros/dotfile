"" General
""" Leader remap
nnoremap <space> <nop>
let mapleader=" "

""" allow switch hidden
set hidden

""" autoreload buffer when running external command
set autoread

""" search
set incsearch "" incremental search
set ignorecase "" caseinsensitive

""" line number
set number
set relativenumber

""" indentation
set autoindent "always set autoindenting on
set tabstop=2 shiftwidth=2 softtabstop=2 " tab and space indentation should be 2
set expandtab  " always expand tab to space

""" menu
set wildmenu                                       "better menu with completion in command mode
set wildmode=longest:full,full
"""" autocomplete display menu for one item and do not select a match from menu
set completeopt=menuone,noselect

"""always show n lines above/below the cursor
set scrolloff=8

""" do not autowrap when go over num line
set textwidth=0 wrapmargin=0
""" display text width column
set colorcolumn=121

" The length of time Vim waits after you stop typing before it triggers the
"plugin is governed by the setting updatetime. Default is 4000 which is very
"long
set updatetime=300

set noerrorbells " silent on error

"" bakcup and history
set noswapfile
set nobackup
set undodir="~/.vim/undodir"
set undofile " vim persist undo to a file in undodir

"" allow jsonc format
autocmd FileType json syntax match Comment +\/\/.\+$+

"" basic keymap
""" remove search highlight
nmap <leader>q <cmd>nohlsearch<CR>

""" quickfix borrow from
""" https://github.com/awesome-streamers/awesome-streamerrc/blob/8f93c5d5a0b7d1c333166fec1f1d28aeee02933d/ThePrimeagen/plugin/navigation.vim
let g:dephiros_qf_l = 0
let g:dephiros_qf_g = 0

fun! ToggleQFList(global)
  if a:global
    if g:dephiros_qf_g == 1
      let g:dephiros_qf_g = 0
      cclose
    else
      let g:dephiros_qf_g = 1
      copen
    end
  else
    if g:dephiros_qf_l == 1
      let g:dephiros_qf_l = 0
      lclose
    else
      let g:dephiros_qf_l = 1
      lopen
    end
  endif
endfun

"" quickfix
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <leader>q :call ToggleQFList(0)<CR>

""" window navigation with M-hjkl
"""" Terminal mode:
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
"""" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
"""" Visual mode:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
"""" Normal mode:
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

""" escape terminal 
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>

""" jk for exiting normal mode
tnoremap jk <C-\><C-n>
inoremap jk <esc>

nnoremap <leader>w <cmd>w<cr>

"" abbrv
iabbrev tmorrow tomorrow
iabbrev tmrrow tomorrow

""" load lsp
augroup THE_PRIMEAGEN_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
augroup END

"" Plugins
lua require('p/plugins')()

echo "🥳"
