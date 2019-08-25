set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"----------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

filetype plugin indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
"----------------------------------------------------------
"set t_Co=256
set termguicolors
" needed to enable true color in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:airline_theme='molokai'
colorscheme molokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pure appearence
"----------------------------------------------------------
set nofoldenable
set nowrap
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent and tabbing
"----------------------------------------------------------
set textwidth=80

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set cinoptions=g1,h1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search
"----------------------------------------------------------
" ignore case in search
set ignorecase
" disable ignorecase if mixed case search
set smartcase


let mapleader = ","

" leave insert mode with ctrl-l
:imap <C-L> <Esc>

let g:ycm_use_clangd = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set rtp+=/usr/local/opt/fzf     " for Homebrew
"set rtp+=/home/nwatkins/src/fzf " from source
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" see: https://github.com/junegunn/fzf.vim#commands
nmap ; :Buffers<CR>
" default to GFiles but fallback to Files if not in a Git repository
nnoremap <expr> <Leader>t (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
nmap <Leader>c :Colors<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" useful for hugo
let g:vim_markdown_toml_frontmatter = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" list mode: displaying invisible characters
"  - may affect formatting
"-----------------------------------------------------------
set list
set listchars=tab:▸\ ,eol:¬
nmap <Leader>l :set list!<CR>
"set listchars=tab:\|\-,eol:¬
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59
