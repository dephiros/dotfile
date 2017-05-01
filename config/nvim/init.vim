" KeyMap
"" Mapping alt-hjkl to move window
:tnoremap ˙ <C-\><C-n><C-w>h
:tnoremap ∆ <C-\><C-n><C-w>j
:tnoremap ˚ <C-\><C-n><C-w>k
:tnoremap ¬ <C-\><C-n><C-w>l
:nnoremap ˙ <C-w>h
:nnoremap ∆ <C-w>j
:nnoremap ˚ <C-w>k
:nnoremap ¬ <C-w>l

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
Plug 'neomake/neomake'
call plug#end()


