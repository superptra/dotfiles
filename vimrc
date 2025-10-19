""" Begin vim-plug plugins 
call plug#begin()
"Pretty stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'

"Coding
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
""Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate' "Less need for python support...
Plug 'honza/vim-snippets'

"LaTex
Plug 'lervag/vimtex', { 'tag': 'v2.15' }

"Easy formatting
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'

"Filesystem navigation
Plug 'scrooloose/nerdtree'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

"Misc
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'tpope/vim-sensible'
call plug#end()

""" Misc stuff

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Set backups to not litter file directories
set backup
set backupdir^=~/.vim/backup//
set undofile	
set undodir^=~/.vim/undo//

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 88 characters because I like black
  autocmd FileType text setlocal textwidth=88
augroup END

""" Begin Personal customization 

syntax enable " Don't know if this is strictly necessary but can't hurt
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set noshowmode
filetype plugin indent on
set wrap
set breakindent
set termguicolors

""" Begin Generic Keybinds
let mapleader = " "
let maplocalleader = " "


""" Begin Plugin Customization

"VimTex
autocmd FileType tex setlocal spell
let g:tex_flavor='latex'
let g:vimtex_fold_enabled = 1
"" May use these later?
"let g:vimtex_quickfix_ignore_filters = [
      "\ 'Marginpar on page',
      "\ 'float specifier',
      "\ 'Overfull \\hbox',
      "\ 'Underfull \\hbox',
      "\ 'contains only floats',
      "\ 'headheight is too small',
      "\ 'Missing',
      "\ 'Package hyperref warning',
      "\ 'Token not allowed',
      "\ 'invalid in math mode',
      "\ 'may have changed',
      "\]

"Theme
colorscheme solarized8
set background=light

"Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
autocmd FileType python nmap K <Plug>(ale_hover)
autocmd FileType python nmap gd <Plug>(ale_go_to_definition)
autocmd FileType python nmap gi <Plug>(ale_go_to_implementation)
autocmd FileType python nmap <leader>l <Plug>(ale_lint)
autocmd FileType python nmap <F5> <Plug>(ale_fix)
autocmd FileType python nmap <F3> <Plug>(ale_reset_buffer)


let g:ale_linters = {
\    'python': ['pylsp'],
\}

let g:ale_fixers = {
\    'python': ['black'],
\}

"Tagbar
nmap <F8> :TagbarToggle<CR>

"Tabularize
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:<CR>
vmap <leader>a: :Tabularize /:<CR>

"Airline
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'light'   " or 'light' to match your background

"Vim slime
let g:slime_python_ipython = 1
let g:slime_target ="tmux"
let g:slime_bracketed_paste = 1

" always send text to the top-right pane in the current tmux tab without
" asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom-right}' }
let g:slime_dont_ask_default = 1

