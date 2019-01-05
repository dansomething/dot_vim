" https://github.com/fwcd/KotlinLanguageServer/blob/master/BUILDING.md
if executable('kotlin-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'kotlin-language-server',
        \ 'cmd': {server_info->['kotlin-language-server']},
        \ 'whitelist': ['kotlin'],
        \ })
endif

setlocal omnifunc=lsp#complete
setlocal commentstring=\/\/\ %s

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
nnoremap <Space>xt :TestNearest<CR>

let test#custom_runners.Kotlin = ['Gradletest', 'Maventest']
