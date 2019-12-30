set timeoutlen=1000 ttimeoutlen=0
set path=**
set wildignore+=**/node_modules/**
set wildignore+=**/.venv/**
set nocompatible
syntax enable
filetype plugin on

" Window resize via Alt + Shift + arrows
map <S-h> 5<C-W><
map <S-l> 5<C-W>>
map <S-k> 5<C-W>-
map <S-j> 5<C-W>+

inoremap {<CR> {<CR>}<Esc>O
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set autoindent
set smartindent
:set tabstop=8 softtabstop=4 shiftwidth=4 noexpandtab

" Reload netrw tree after expanding a directory
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

let g:netrw_altv = 1 " Vertical split right when open vertical split with netrw
let g:netrw_banner = 0 " No Banner
let g:netrw_liststyle = 3 "Expandable tree
let g:netrw_browse_split = 4 "Open file in previous buffer
let g:netrw_winsize = 15 "15% window width for tree

" Relative number on when in cmd, absolute number on when in ins
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set number
:augroup END

" Horizontal and vertical vim split bar styling
set fillchars=""
highlight VertSplit ctermbg=White ctermfg=DarkGray
highlight StatusLine ctermbg=Black ctermfg=DarkMagenta
highlight StatusLineNC ctermbg=White ctermfg=DarkGray
