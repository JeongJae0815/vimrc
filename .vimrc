" ======================== General Settings =============================
set nocp "make it enable to use vim's own funciton
set all& "set default setting
set hi=100 " set the number of vim command history
set backspace=indent,eol,start "enable backspace on INSERT MODE
set ru "show a location of current cursor (row, col) on bottom right
"set sc "????
"set nu "show line number
set hls "highlight search WoRd  ex) /word
set nows " go to the first searching word at the end of searching (disable)
set ic " ignore case sensitive(uppercase,lowercase) when searching
set scs "enagle smart case sensitive when searching
set ls=2 " Always shows status line on the bottom
set ai " auto indentation same as upper line, don't have to set.. maybe default settingc
set si " smart indentation when using if, for, don't have to set.. maybe default settingc
set paste "prevent step phenomenon on paste when ai, si is on
set showmatch " highlight matching parenthesis ex) { } 
set autoread " Automatically update the new change in the buffer when modified outside of vim
set cino=N-s               " c++ namespace indentation
set cursorline             " current line highlighting
set noswapfile
set ffs=unix,dos,mac "set file format
" tab size
set ts=4
set sw=4 "wehn << , >> of size
	
" enable auto indentation
"set autoindent
"set cindent

" encoding setting ??
set enc=utf8
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp949,latin1

" tab <==> space change (disabled)??
set noet
set sts=0

syntax on "auto syntax highligh
filetype plugin indent on "1. recognize file type, 2. dffiernt plugin type which depends on file type, 3. Flexible indent depending on file type
" ======================== General Mapping =============================
" Undo in insert mode. :c-w, un/redo in normal mode : u, c-r
" Disable highlighted search word. when type enter
nnoremap <CR> :noh<CR><CR>
" redo
nmap U :redo<CR>
" \ -> ,
let mapleader = ","
" ======================== Plugins  =============================
"type :PluginInstall when you install plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim' "color scheme
Plugin 'majutsushi/tagbar' "to use tagbar you should install ctags sudo apt-get insatll ctags
Plugin 'scrooloose/nerdtree' "file tree plugin
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

call vundle#end()
			
" ======================== Plugin Mapping =============================

"NerdTree setting
nnoremap <C-f> :NERDTreeToggle<CR>
"Tagbar
nmap <C-T> :Tagbar<CR>            

" vim-lsp

" ======================== Plugin Settings =============================
"for color scheme
colorscheme jellybeans

" vim-lsp (using clangd)
if has("unix")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		" macosx for clangd (6.0)
		if executable('clangd')
			augroup lsp_clangd
				autocmd!
				autocmd User lsp_setup call lsp#register_server({
							\ 'name': 'clangd',
							\ 'cmd': {server_info->['clangd']},
							\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
							\ })
			augroup end
		endif
	else
		" linux for clangd-9 
		if executable('clangd-9')
			augroup lsp_clangd
				autocmd!
				autocmd User lsp_setup call lsp#register_server({
							\ 'name': 'clangd',
							\ 'cmd': {server_info->['clangd-9']},
							\ 'whitelist': ['c', 'cpp','cxx','objc', 'objcpp','h','hxx'],
							\ })
			augroup end
		endif
	endif
endif

" python ($ pip install python-language-server)	
if executable('pyls')
	augroup lsp_clangd
		autocmd User lsp_setup call lsp#register_server({
					\ 'name': 'pyls',
					\ 'cmd': {server_info->['pyls']},
					\ 'whitelist': ['python'],
					\ })
	augroup end
endif
	
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_highlights_enabled = 1
let g:lsp_textprop_enabled = 1
let g:lsp_diagnostics_enabled = 1         " enable diagnostics support
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"--------------------------------------------------------------------vim setting-----------------------------------------------
"set ruler "show current curosr location on right below side
"set nu "set line number on left side of terminal
"set nowrap "set not te be appearedwhen lines go after the screen
"set noswapfile "set not to make .swap files
"set incsearch "set search with '/', fore example type '/set' and move between reulsts with n(forward) shift-n after enter
"set hlsearch "show all incsearch result with highlighting
"set highlighting color
"hi Search cterm=inverse
if has('persistent_undo')
        set undodir=~/.vim/undodir "set dir to save undo result
        set undofile
endif
"let g:explSplitRight=1
