" ----------------------------------------
" vim-plug
" ----------------------------------------

" auto install vim-plug and plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" ---------------
" Plug Bundles
" ---------------

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Chiel92/vim-autoformat', { 'on': ['Autoformat'] }
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'Valloric/ListToggle'
Plug 'andymass/vim-matchup'
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'sass', 'scss'] }
Plug 'christoomey/vim-tmux-navigator'
Plug 'dansomething/vim-hackernews', { 'on': 'HackerNews' }
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-zoom'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestNearest'] }
Plug 'jiangmiao/auto-pairs'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kien/rainbow_parentheses.vim'
Plug 'liuchengxu/vista.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree', { 'on':  ['UndotreeShow', 'UndotreeToggle'] }
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'tag': '*'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'puremourning/vimspector'
Plug 'samsonw/vim-task', { 'for': 'task' }
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive', { 'tag': '*' }
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/UnconditionalPaste'
Plug 'whiteinge/diffconflicts'
Plug 'wincent/loupe'
Plug 'yssl/QFEnter'

" Add plugins to &runtimepath
call plug#end()
