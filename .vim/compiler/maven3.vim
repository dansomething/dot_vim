" Vim Compiler File
" Compiler: maven3
" Based on maven2

if exists("g:current_compiler")
    finish
endif
let g:current_compiler = "maven3"

if exists(":CompilerSet") != 2    " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mvn

" See also
" https://github.com/ervandew/eclim/blob/40aa7c85fc64da6beecc45691091b9c6f2c9e852/org.eclim.jdt/vim/eclim/compiler/eclim_mvn.vim
" https://github.com/JalaiAmitahl/maven-compiler.vim/blob/master/compiler/mvn.vim
" https://github.com/mikelue/vim-maven-plugin/blob/master/compiler/maven.vim

" POM related messages
CompilerSet errorformat=%E[ERROR]\ %#Non-parseable\ POM\ %f:\ %m\ %#\\@\ line\ %l\\,\ column\ %c%.%#,%Z,
CompilerSet errorformat+=%+E[ERROR]\ %#Malformed\ POM\ %f:%m\ %#\\@\ %.%#\\,\ line\ %l\\,\ column\ %c%.%#,%Z,

" Java related build messages
CompilerSet errorformat+=%+I[INFO]\ BUILD\ %m,%Z
CompilerSet errorformat+=%E[ERROR]\ %f:[%l\\,%c]\ %m,%Z
CompilerSet errorformat+=%A[%t%[A-Z]%#]\ %f:[%l\\,%c]\ %m,%Z
CompilerSet errorformat+=%A%f:[%l\\,%c]\ %m,%Z

" jUnit related build messages
CompilerSet errorformat+=%+I[INFO]\ Tests\ run:\ %m,%Z
CompilerSet errorformat+=%+E\ \ %#test%m,%Z
CompilerSet errorformat+=%+E[ERROR]\ Please\ refer\ to\ %f\ for\ the\ individual\ test\ results.

" Misc message removal
CompilerSet errorformat+=%-G%.%#,%Z
