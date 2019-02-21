" Basic vimrc file 
"
" Maintainer: Michael Penhallegon <mike@hematite.tech>
" Last change:	03 Jan 2019
"

" Gvim settings
colorscheme darkblue
if has('gui_running')
  set guifont=Lucida_Console:h8
endif

" set history to 200 commands
set nocompatible
set history=200

" set visible bell to stop bell sound
set vb

" tabs and kill spaces
" sets:
" noexpandtable
" copyidents
" softtabstop = 0
" shiftwidth = 4
" tabstop = 4
:set noet ci pi sts=0 sw=4 ts=4


" turn on line number
:set number

" gets rid of tilde file
:set nobackup

" set shell to powershellco only if win32
" turn on spellcheck
if has("win32")
:set shell=powershell
:set spelllang=en
:set spellfile=$HOME/Documents/vim/en.utf-8.add
endif

" highlight textwidth + 1 colum (where a EOL should go)
:set colorcolumn=+1
:highlight ColorColumn ctermbg=red guibg=lightgrey

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" open split below, useful for opening :term correctly
set splitbelow

" set default sql syntax as postgresql
let g:sql_type_default = 'pgsql'
