set nocompatible              " be iMproved, required
filetype off                  " required

" tslime key bindings
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

set tabstop=4
set shiftwidth=4
set expandtab