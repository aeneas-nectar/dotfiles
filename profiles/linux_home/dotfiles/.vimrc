set number
set hidden
set nocp
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set relativenumber number
set hlsearch
set incsearch


let g:rainbow_active = 1

filetype plugin on


"remap ctrl+f to files search
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap <esc><esc> :noh<return><esc>
" disable arrow navigation for practice"
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" Plugins for vim-plug ; run :PlugInstall to update
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-gitgutter' 
  Plug 'frazrepo/vim-rainbow'
call plug#end()

