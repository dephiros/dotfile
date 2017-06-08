" https://github.com/mcantor/no_plugins/blob/master/no_plugins.vim
" provide tab completion for all file-related tab
set path+=**

" display all matching files when we tab complete
set wildmenu
" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" netrw for file browsing
let g:netrw_banner=0 " disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 "tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" NOW WE CAN:
" " - :edit a folder to open a file browser
" " - <CR>/v/t to open in an h-split/v-split/tab
" " - check |netrw-browse-maps| for more mappings"

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces
" wrap at 120
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set nolist  " list disables linebreak"
" turn syntax highlighting on
" turn line numbers on
set number
" highlight matching braces
set showmatch

" KeyMap
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"" remap leader key
""let mapleader=","
"" Mapping alt-hjkl to move window
:nnoremap ˙ <C-w>h
:nnoremap ∆ <C-w>j
:nnoremap ˚ <C-w>k
:nnoremap ¬ <C-w>l

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  echo "installing vim plug\n"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes

" sensible
Plug 'tpope/vim-sensible'

" editor config
Plug 'editorconfig/editorconfig-vim'

" misc utility
Plug 'xolox/vim-misc'

" lint
Plug 'w0rp/ale'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Add clang, clangtidy to this list once we get it setup
let g:ale_linters = {
  \'cpp': ['cppcheck', 'gcc'],
\}

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'ntpeters/vim-better-whitespace'

" theme
Plug 'chriskempson/base16-vim'

" git stuff
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'sheerun/vim-polyglot'

" org mode plugin
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode'

" markdown plugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" vimwiki plugin
Plug 'vimwiki/vimwiki'
Plug 'blindFS/vim-taskwarrior'
Plug 'tbabej/taskwiki'
let g:vimwiki_list = [
                        \{'path': '~/Google Drive/vimwiki/personal.wiki'},
                        \{'path': '~/Google Drive/vimwiki/zonar.wiki'}
                     \]
let g:vimwiki_folding='expr'
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" controlp vim
Plug 'ctrlpvim/ctrlp.vim'

" session management
Plug 'xolox/vim-session'

call plug#end()

" not sure why it does not work if put right after Plug color scheme
colorscheme base16-ashes
