" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------

" ---------------
" Color
" ---------------
" Use 256 color mode if available
if $TERM =~ "-256color"
   set t_Co=256
endif

" Use 24-bit (true-color) mode if available
" https://github.com/neovim/neovim/wiki/FAQ#how-can-i-use-true-color-in-the-terminal
if (has("termguicolors"))
  set termguicolors
  if (!has("nvim"))
    " set Vim-specific sequences for RGB colors
    " https://github.com/vim/vim/issues/993#issuecomment-241675433
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

set background=dark
try
  colorscheme jellybeans
  " Match SignColumn background to normal background for a "transparent" gutter
  let g:jellybeans_overrides = { 'SignColumn': { 'guibg': 'NONE' } }
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme desert
endtry

" -----------------------------
" File Locations
" -----------------------------
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp
set spellfile=~/.vim/spell/custom.en.utf-8.add
" Persistent Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
  if (has("nvim"))
    set undodir=~/.vim/.undo_nvim
  endif
endif

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
set noequalalways  " Don't auto resize after splitting or closing a window
set noshowmode     " Don't show the mode since Powerline shows it
set splitright     " Open the new window right of the current one
set title          " Set the title of the window in the terminal to the file
set textwidth=120  " 80 is too narrow anymore
if exists('+colorcolumn')
  set colorcolumn=120 " Color the 120th column differently as a wrapping guide.
endif

" ---------------
" Behaviors
" ---------------
syntax enable
set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
if !has("nvim")
  set clipboard+=unnamed " Yanks go on clipboard instead.
else
  set clipboard+=unnamedplus
endif
set autowrite          " Writes on make/shell commands
set timeoutlen=450     " Time to wait for a command (after leader for example).
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " I really don't like folds.
set formatoptions=crql
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=3        " Keep three lines below the last line when scrolling
set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists

" ---------------
" Text Format
" ---------------
set tabstop=2
set softtabstop=2
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*/.tmp/*,*/test-output/*,*/bin/*,*/target*/*,*/build/*,
      \*/node_modules/*,*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
      \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ---------------
" Visual
" ---------------
set cursorline
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list
" Ignore whitespace changes in diffs
set diffopt+=iwhite
" Disable autocomplete scratch buffer
set completeopt-=preview
set completeopt+=longest

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:.
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<
" make non-breaking spaces (\u00a0) visible
set listchars+=nbsp:▸

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U
