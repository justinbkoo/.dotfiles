set timeoutlen=1000 ttimeoutlen=0
set path=**
set wildignore+=**/node_modules/**
set wildignore+=**/.venv/**
set nocompatible " Ignored by neovim (neovim always noncompatible)

syntax enable
filetype plugin on

:let mapleader=","

" Window resize via Shift + (h|j|k|l)
nnoremap <S-h> 5<C-W><
nnoremap <S-l> 5<C-W>>
nnoremap <S-k> 5<C-W>-
nnoremap <S-j> 5<C-W>+

" Switch windows via Ctrl + (h|j|k|l)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" F3 on word under cursor brings up "help" on that word
nnoremap <F3> "zyiw:exe "h ".@z.""<CR>
    
:set autoindent
:set smartindent
:set tabstop=8 softtabstop=4 shiftwidth=4 noexpandtab

" Reload netrw tree after expanding a directory
:let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

:let g:netrw_altv = 1 " Vertical split right when open vertical split with netrw
:let g:netrw_banner = 0 " No Banner
:let g:netrw_liststyle = 3 "Expandable tree
:let g:netrw_browse_split = 4 "Open file in previous buffer
:let g:netrw_winsize = 15 "15% window width for tree

" Relative number on when in cmd, absolute number on when in ins
:augroup numbertoggle
    :autocmd!
    :autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    :autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
    :autocmd BufLeave,FocusLost,InsertEnter * set number
:augroup END

" Horizontal and vertical vim split bar styling
set fillchars=""
highlight VertSplit ctermbg=White ctermfg=DarkGray
highlight StatusLine ctermbg=Black ctermfg=DarkMagenta
highlight StatusLineNC ctermbg=White ctermfg=DarkGray

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

" Automatically source vimrc on save
autocmd! bufwritepost $HOME/.vimrc source $MYVIMRC
