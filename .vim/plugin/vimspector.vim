" let g:vimspector_enable_mappings = 'HUMAN'

" function! JavaStartDebugCallback(err, resp)
"   execute "cexpr! 'Java debug started on port: " . a:resp . "'"
" endfunction

" nmap <F1> :call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartDebugCallback'))<CR>
nmap <F1> :<C-u>CocCommand java.debug.start<CR>
nmap <F2> <Plug>VimspectorToggleBreakpoint
nmap <F3> <Plug>VimspectorAddFunctionBreakpoint
nmap <F4> <Plug>VimspectorRestart
nmap <F5> <Plug>VimspectorStepOver
nmap <F6> <Plug>VimspectorStepInto
nmap <F7> <Plug>VimspectorStepOut
nmap <F8> <Plug>VimspectorContinue
nmap <F9> <Plug>VimspectorStop
nmap <F10> <Plug>VimspectorRestart
