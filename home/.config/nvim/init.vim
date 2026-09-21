" See :help nvim-from-vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
" Extra local only config that is not committed and loaded before the main vimrc.
let s:extraFile=expand("~/.vim/extra.vim")
if filereadable(s:extraFile)
  exe "source " . s:extraFile
endif
source ~/.vim/vimrc
lua require('init')
