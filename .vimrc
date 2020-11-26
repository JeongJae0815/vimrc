set shell=/bin/bash "using fish shell
set rtp+=~/.vim/bundle/Vundle.vim

"type :PluginInstall when you install plugin sajflksafjsdklfjsakdj
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar' "to use tagbar you should install ctags sudo apt-get insatll ctags
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'

call vundle#end()

syntax enable
filetype plugin indent on
highlight Comment term=bold cterm=bold ctermfg=4

"for color scheme
"colorscheme jellybeans
colorscheme gruvbox
set bg=dark
"custom map
let mapleader=","

"nnoremap <Leader>rc :rightbelow vnew
"NerdTree setting
nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTree<CR>
"hlsearch
nnoremap <CR> :noh<CR><CR>

"--------------------------------------------------------------------vim setting-----------------------------------------------
set ruler "show current curosr location on right below side
"set nu "set line number on left side of terminal
set nowrap "set not te be appearedwhen lines go after the screen
set noswapfile "set not to make .swap files
set incsearch "set search with '/', fore example type '/set' and move between reulsts with n(forward) shift-n after enter
set hlsearch "show all incsearch result with highlighting
"set highlighting color
"hi Search cterm=inverse
if has('persistent_undo')
        set undodir=~/.vim/undodir "set dir to save undo result
        set undofile
endif
