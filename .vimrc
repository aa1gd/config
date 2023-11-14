set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

set number

" set cursorline

" set cursorcolumn

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

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Hard wrapping at 80 chars and wrapping cursor at the end of a line
set textwidth=80
set whichwrap+=<,>,h,l

" Visual Border for the 80 char border
set colorcolumn=80
highlight ColorColumn ctermbg=8

" Load the termdebug plugin
packadd termdebug

" Enable use of the mouse
set mouse=a

" Folding options. Indent folding with manual folds
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set foldnestmax=1

" Save the folds automatically
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Open new windows on the right
set splitright

" SHORTCUTS

let mapleader = "\<Space>"
set notimeout

" Editing .vimrc
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :w<cr> :source $MYVIMRC<cr> :noh<cr>

" Better tab shortcuts
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>t<leader> :tabnext<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>

" Shortcut to compile and run
" autocmd filetype c nnoremap <C-b> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' <CR>

" Shortcut to run
" && ./'.shellescape('%:r')

" Open file explorer to the right
nnoremap <leader>; :Vexplore!<cr>

" Open file explorer in new tab
nnoremap <leader>: :tabnew<cr>:Explore<cr>

" Open terminal to the right
nnoremap <leader><cr> :vertical terminal<cr>

" Open termdebug vertically
nnoremap <leader>d :Termdebug<cr>
let g:termdebug_wide=1

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

set <a-t>=t
noremap <a-t> <C-w>T