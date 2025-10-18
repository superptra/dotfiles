"Plugins
call plug#begin()
"Pretty stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'

"Coding
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'

"Utility
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
call plug#end()

" Personal customization
"
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set noshowmode
let g:tex_flavor='latex'
filetype plugin indent on

set background=light
set termguicolors
colorscheme solarized8

"Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0

"Airline
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'light'   " or 'light' to match your background
