set nocompatible 
filetype plugin on
filetype plugin indent on  
set tabstop=8
set shiftwidth=8
set softtabstop=8                   
set autoindent   
set smartindent  
set termguicolors
colorscheme everforest
nnoremap <Leader>cc :set colorcolumn=80<cr>
nnoremap <Leader>ncc :set colorcolumn-=80<cr> 
set mouse=a                    
set hidden
set number
set encoding=UTF-8



" Vimplug
call plug#begin()
"Plug 'tpope/vim-sensible'
Plug 'philrunninger/nerdtree-visual-selection'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'bagrat/vim-buffet'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'jiangmiao/auto-pairs'
Plug 'leafoftree/vim-project'
Plug 'aserebryakov/vim-todo-lists'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" NERDTree config
let g:NERDTreeWinPos = "right"
nnoremap <F3> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-f> :NERDTreeFocus<CR>
let g:NERDTreeChDirMode = 2

" vim-buffet
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>
map <C-t> :tab split<CR>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Lightline bufferline 
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-e> <Plug>(ale_next_wrap)
nmap <silent> <C-q> <Plug>(ale_previous_wrap)

" File shortcut
nmap <leader>v :find ~/.vim/.shortcuts<CR>
nmap <leader>c :find ~/.vimrc<CR>
