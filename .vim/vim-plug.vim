" ----------------------------------------
" vim-plug
" ----------------------------------------

" Auto install vim-plug and plugins on first load
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" ---------------
" Plug Bundles
" ---------------
" https://github.com/dansomething/dot_vim#plugin-list
" ---------------
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'Chiel92/vim-autoformat', { 'on': ['Autoformat', 'CurrentFormat'] }
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'Valloric/ListToggle'
Plug 'andymass/vim-matchup'
Plug 'antoinemadec/coc-fzf', { 'branch': 'release' }
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'sass', 'scss'] }
Plug 'artnez/vim-wipeout', { 'on': ['Wipeout'] }
Plug 'charlespascoe/vim-go-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dansomething/vim-hackernews', { 'on': 'HackerNews' }
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-zoom'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'fidian/hexmode'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install', 'for': 'markdown' }
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kien/rainbow_parentheses.vim'
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree', { 'on':  ['UndotreeShow', 'UndotreeToggle'] }
Plug 'mhinz/vim-signify'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'puremourning/vimspector'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'whiteinge/diffconflicts'
Plug 'wincent/loupe'
Plug 'yssl/QFEnter'

" Add plugins to &runtimepath
call plug#end()
