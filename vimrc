call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'  " git diff in the 'gutter' (sign column). It shows which lines have been added, modified, or removed.
Plug 'aonemd/kuroi.vim'  "a dark theme
Plug 'morhetz/gruvbox' " retro theme
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Install binary
Plug 'junegunn/fzf.vim' " Install vim support
Plug 'mattn/emmet-vim'  "
Plug 'sheerun/vim-polyglot'  "support over 100 languages and load them on demand
" Plug 'dense-analysis/ale'  " support linting, jump to definition and autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html'
Plug 'amiralies/coc-flow'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-yaml'
Plug 'tpope/vim-fugitive'  "a git wrapper for vim
Plug 'tpope/vim-eunuch'  " Add helpful unix command :Delete :Move :Chmod :Sudo :SudoEdit :Wall
Plug 'justinmk/vim-dirvish'  " similar to vim-vinegar but not based on netrw and allow :Shdo command after modifying the buffer
Plug 'tpope/vim-abolish'  " allow case sensitive replace and abbreviation
Plug 'vim-airline/vim-airline'  " upgrade the existing status bar at the bottom

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
set colorcolumn=121                                 "display text width column
" indentation
set autoindent                                     "always set autoindenting on
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "use two spaces for indentation
autocmd! FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
set incsearch                                      "incremental search highlight
set ignorecase                                     "searches are case insensitive...
set smartcase                                      " ..unless they contain at least one capital letter
set hlsearch                                       "highlight search patterns
" See https://github.com/dense-analysis/ale/issues/1700
" :h ale-completion-completeopt-bug
set completeopt=menu,menuone,preview,noselect,noinsert
" The length of time Vim waits after you stop typing before it triggers the
"plugin is governed by the setting updatetime. Default is 4000 which is very
"long
set updatetime=740
set hidden " needed for coc since text edit might fail
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


set t_Co=256                        "enable 256 colors
set background=dark
let g:gruvbox_italic=1 
colorscheme gruvbox

"status line: modifiedflag, charcount, filepercent, filepath
set statusline=%=%m\ %c\ %P\ %f

" Turn on omnicompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" .............................................................................
" netrw
" .............................................................................
let g:netrw_liststyle = 3  " Use the tree view as default. Hit i to change view
let g:netrw_browsex_viewer="open"
let g:netrw_browse_split = 2  " Open netrw by default in a vertical split
let g:netrw_winsize = 25  " Use 25% of the window width
let g:netrw_altv=1  " if in a netwr view and open a file with v, open to the right instead of left
let g:netrw_alto=1  " if in a netwr view and open a file with o, open to the bottom instead of top

" .............................................................................
" COC
" .............................................................................
" Configuration can be done inside vimrc. See :h g:coc_user_config
" For workspace configuration, add .vim/coc-settings.json

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()lug 'neoclide/coc-json'
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" To get correct comment highlighting in jsonc which is the configuration for
" coc
autocmd FileType json syntax match Comment +\/\/.\+$+
let g:coc_user_config = {
\ 'tsserver': {
  \ 'enableJavascript': v:false
\ }
\}


" .............................................................................
" dense-analysis/ale
" .............................................................................
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['prettier', 'eslint'],
" \   'typescript': ['prettier', 'eslint'],
" \   'typescriptreact': ['prettier', 'eslint'],
" \   'css': ['prettier'],
" \   'markdown': ['prettier'],
" \}
" let g:ale_linters = {
" \   'javascript': ['eslint', 'flow-language-server'],
" \}
" let g:ale_linters_ignore = {
" \   'javascript': ['tsserver'],
" \}
" let g:ale_linters_explicit = 1
" let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
" let g:ale_sign_error = '●'
" let g:ale_sign_warning = '.'
" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1 " use coc
" let g:ale_completion_tsserver_autoimport = 1 " use coc
" let g:ale_javascript_eslint_executable = 'yarn'
" let g:ale_javascript_eslint_options = 'run eslint'
" ale should set filetype for jsx filetype
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" .............................................................................
" plasticboy/vim-markdown
" .............................................................................
" zr: reduces fold level throughout the buffer
" zR: opens all folds
" zm: increases fold level throughout the buffer
" zM: folds everything all the way
" za: open a fold your cursor is on
" zA: open a fold your cursor is on recursively
" zc: close a fold your cursor is on
" zC: close a fold your cursor is on recursively

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
" If you want to have a link like this [link text](link-url) and follow it for editing in vim using the ge command, but have it open the file 'link-url.md' instead of the file 'link-url', then use this option:
let g:vim_markdown_no_extensions_in_markdown = 1
" If you follow a link like this [link text](link-url) using the ge shortcut, this option will automatically save any edits you made before moving you:
let g:vim_markdown_autowrite = 1
let g:vim_markdown_auto_extension_ext = 'txt'


" .............................................................................
" FILE MAP
" .............................................................................
" allow jsonc format
autocmd FileType json syntax match Comment +\/\/.\+$+

" *KEY MAP*

" Space is now another leader key
map <Space> <Leader>


"remove search highlight
nmap <leader>q :nohlsearch<CR>

"fzf
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <leader>o :Lines<cr>
nnoremap <Leader>t :BTags<CR>
nnoremap <leader>T :Tags<cr>

" fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gf :diffget //3<CR>
nnoremap <leader>gj :diffget //2<CR>

" :Find to grep for files
" --column: Show column number
"
"  " --line-number: Show line number
"
"  " --no-heading: Do not show file headings in results
"
"  " --fixed-strings: Search term as a literal string
"
"  " --ignore-case: Case insensitive search
"
"  " --no-ignore: Do not respect .gitignore, etc...
"
"  " --hidden: Search hidden files and folders
"
"  " --follow: Follow symlinks
"
"  " --glob: Additional conditions for search (in this case ignore everything
"  in the .git/ folder)
"
"  " --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
set grepprg=rg\ --vimgrep


" Ale
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
