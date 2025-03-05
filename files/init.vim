call plug#begin()

" Plugins
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

syntax on
set number
set cursorline
set termguicolors
filetype indent on
set lazyredraw
set showmatch
set incsearch

colorscheme catppuccin-frappe

set tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead Jenkinsfile setf groovy
au BufNewFile,BufRead *.json so ~/.vim/syntax/json.vim
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim

