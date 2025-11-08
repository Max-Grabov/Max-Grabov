" Tab should always be 2 spaces, I will not back down on this
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set expandtab

set laststatus=2
set noshowmode

" Get Vim Plug if we don't have it. (e.g. new pc or environment)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 

" Auto install any plugins that aren't detected on the system
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Vim plug function to list out everything
call plug#begin()
" LSP setup
" While editing a file (e.g. cxx), run :LspInstallServer to autopick up the
" desired LSP Server
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Plugins for theme, maybe I'll swap to catpuccin if I want to be performative
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Theme configuration
colorscheme onedark

" Remaps
" Fuzzy finder maps
nmap <Space>f :Files .<CR>
nmap <Space>g :GFiles .<CR>

" Auto Complete maps
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>" 

