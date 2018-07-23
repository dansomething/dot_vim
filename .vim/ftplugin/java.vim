" https://github.com/Valloric/YouCompleteMe#java
nnoremap <Space>c :YcmCompleter FixIt<CR>
nnoremap <Space>dd :YcmCompleter GetDoc<CR>
nnoremap <Space>f :YcmCompleter Format<CR>
nnoremap <Space>io :YcmCompleter OrganizeImports<CR>
nnoremap <Space>o :execute "Dispatch! open -a Eclipse " . expand('%')<CR>
nnoremap <Space>p :YcmDiags<CR>
nnoremap <Space>r :YcmCompleter RefactorRename <c-r><c-w>
nnoremap <Space>si :YcmCompleter GoTo<CR>
nnoremap <Space>sr :YcmCompleter GoToReferences<CR>
nnoremap <Space>xt :TestNearest<CR>

" Enable SplitJoin for Java files
" https://github.com/AndrewRadev/splitjoin.vim/issues/33#issuecomment-44213183
if !exists('b:splitjoin_split_callbacks')
  let b:splitjoin_split_callbacks = [
        \ 'sj#js#SplitArgs',
        \ 'sj#js#SplitArray',
        \ 'sj#js#SplitObjectLiteral',
        \ 'sj#js#SplitFunction',
        \ 'sj#js#SplitOneLineIf',
        \ ]
endif
if !exists('b:splitjoin_join_callbacks')
  let b:splitjoin_join_callbacks = [
        \ 'sj#js#JoinArray',
        \ 'sj#js#JoinArgs',
        \ 'sj#js#JoinFunction',
        \ 'sj#js#JoinOneLineIf',
        \ 'sj#js#JoinObjectLiteral',
        \ ]
endif
