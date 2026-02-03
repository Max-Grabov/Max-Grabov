set tabstop=2
set shiftwidth=2
set expandtab
set number
set noshowmode
set ignorecase
set smartcase
set laststatus=2
set hidden
set ttimeoutlen=1

set hlsearch

" Install plugins and plugin manager if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

if !has('gui_running')
  set t_Co=256
endif

" Commands
" ! Overwrittes the current C command if it exists without showing the
" annoying error
":command! C :let @/ = ""

" Maps
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

nnoremap <C-t> :tabnew<CR>  

" Mappings to automatically put a 2nd character for things such as ', ", {
" etc.
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap { {}<left>
"inoremap [ []<left>

" Maps for commenting in visual mode
vnoremap / :norm i//<CR>
vnoremap <C-_> :norm xx<CR>

" Maps for FZF 
nnoremap <Space>f :Files<CR>
nnoremap <Space>g :GFiles<CR>

" Maps for Ale
nnoremap <S-d> :ALEGoToDefinition -tab<CR>
nnoremap <S-t> :ALEGoToTypeDefinition -tab<CR>
nnoremap <S-i> :ALEGoToImplementation -tab<CR>

" Plugins
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'romainl/vim-cool'
Plug 'mhinz/vim-startify'
"Plug 'christoomey/vim-tmux-navigator'
call plug#end()

let g:onedark_config = {
    \ 'style': 'cool',
\}

colorscheme onedark

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_min_input_length = 3

" Ale settings
let g:ale_c_parse_compile_commands=1
let g:ale_c_build_dir_names=['build', 'build-debug', 'build-release']
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

" vim cool
let g:cool_total_matches = 1

