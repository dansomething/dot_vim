" https://github.com/palantir/language-servers
if executable('groovy-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'groovy-language-server',
        \ 'cmd': {server_info->['groovy-language-server']},
        \ 'whitelist': ['groovy'],
        \ })
endif

autocmd FileType groovy setlocal omnifunc=lsp#complete

" :LspDocumentDiagnostics  Get current document diagnostics information
" :LspDefinition  Go to definition
" :LspDocumentFormat  Format entire document
" :LspDocumentRangeFormat  Format document selection
" :LspDocumentSymbol  Show document symbols
" :LspHover  Show hover information
" :LspImplementation  Show implementation of interface
" :LspReferences  Find references
" :LspRename  Rename symbol
" :LspWorkspaceSymbol  Search/Show workspace symbol

nnoremap <Space>f :LspDocumentFormat<CR>
vnoremap <Space>fr "xy :LspDocumentRangeFormat"<C-R>x"
nnoremap <Space>h :LspHover<CR>
nnoremap <Space>o :execute "Dispatch! open -a Eclipse " . expand('%')<CR>
nnoremap <Space>p :LspDocumentDiagnostics<CR>
nnoremap <Space>r :LspRename <c-r><c-w>
nnoremap <Space>si :LspDefinition<CR>
nnoremap <Space>sr :LspReferences  <CR>

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

let test#custom_runners.Groovy = ['Maventest']
