let g:test#custom_runners.Groovy = ['Maventest']

" Enable SplitJoin for Groovy files
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
