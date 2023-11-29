" Godwin's .vimrc for armlab

set nocompatible

set encoding=UTF-8

filetype on

filetype plugin on

filetype indent on

syntax on

set number

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Hard wrapping at 72 chars and wrapping cursor at the end of a line
set textwidth=72
set whichwrap+=<,>,h,l

" Visual Border for the 72 char border
set colorcolumn=72
highlight ColorColumn ctermbg=3

" Enable use of the mouse
set mouse=a

" No folding

" Open new windows on the right
set splitright

" SHORTCUTS

let mapleader = "\<Space>"
set notimeout

" Beginning and end of line
nnoremap H ^
nnoremap L $

" Search results always in middle, and open fold
nnoremap n nzzzv
nnoremap N Nzzzv

" Editing .vimrc
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :w<cr> :source $MYVIMRC<cr> :noh<cr>

" Load the termdebug plugin
packadd termdebug

" Open termdebug vertically
nnoremap <leader>d :Termdebug<cr>
let g:termdebug_wide=1

" Better tab shortcuts
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader><tab> :tabnext<cr>
nnoremap <leader><S-tab> :tabprev<cr>
nnoremap <leader>to :tabonly<cr>

" Go to tab #
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 0gt

" Move to tab #
nnoremap <leader>! :tabmove 0<cr>
nnoremap <leader>@ :tabmove 1<cr>
nnoremap <leader># :tabmove 2<cr>
nnoremap <leader>$ :tabmove 3<cr>
nnoremap <leader>% :tabmove 4<cr>
nnoremap <leader>^ :tabmove 5<cr>
nnoremap <leader>& :tabmove 6<cr>
nnoremap <leader>* :tabmove 7<cr>
nnoremap <leader>( :tabmove 8<cr>
nnoremap <leader>) :tabmove 9<cr>

" DWM-like window navigation
" https://vim.fandom.com/wiki/Get_Alt_key_to_work_in_terminal

set <a-l>=l
set <a-h>=h
set <a-j>=j
set <a-k>=k
noremap <a-l> <C-w>l
noremap <a-h> <C-w>h
noremap <a-j> <C-w>j
noremap <a-k> <C-w>k

set <a-L>=L
set <a-H>=H
set <a-J>=J
set <a-K>=K
noremap <a-L> <C-w>L
noremap <a-H> <C-w>H
noremap <a-J> <C-w>J
noremap <a-K> <C-w>K

set <a-t>=t
noremap <a-t> <C-w>T

set <a-=>==
noremap <a-=> <C-w>=

" Open file explorer to the right
nnoremap <leader>; :Vexplore!<cr>

" Open file explorer in new tab
nnoremap <leader>: :tabnew<cr>:Explore<cr>

" Open terminal to the right
nnoremap <leader><cr> :vertical terminal<cr>

" Open terminal in new tab
nnoremap <leader>T :tab terminal<cr>

" Vim terminal mappings
tnoremap <esc> <C-w>N
tnoremap <a-l> <C-w>l
tnoremap <a-h> <C-w>h
tnoremap <a-j> <C-w>j
tnoremap <a-k> <C-w>k
tnoremap <a-L> <C-w>L
tnoremap <a-H> <C-w>H
tnoremap <a-J> <C-w>J
tnoremap <a-K> <C-w>K

" PLUGINS using vim-plug
" Removing some because they're slow over ssh
call plug#begin()

Plug 'ryanoasis/vim-devicons'

" Removes highlighting after search
Plug 'romainl/vim-cool'

" Git markers
Plug 'airblade/vim-gitgutter'

" Git integration
Plug 'tpope/vim-fugitive'

" Floating terminal
Plug 'voldikss/vim-floaterm'
let g:floaterm_keymap_toggle = '<F4>'
let g:floaterm_width = 0.95
let g:floaterm_height = 0.95

Plug 'preservim/nerdtree'

" Commenting
Plug 'preservim/nerdcommenter'

" Live linting
Plug 'dense-analysis/ale'

" Fuzzy finder
Plug 'junegunn/fzf.vim'

call plug#end()

" Change colorscheme - had to be done after loading plugins
"colorscheme sonokai
colorscheme desert

" NERDTree keybinds
set <a-d>=d
set <a-f>=f
nnoremap <a-d> :NERDTreeToggle<CR>
nnoremap <a-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

