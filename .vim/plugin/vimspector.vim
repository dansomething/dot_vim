" https://github.com/puremourning/vimspector

nmap <F2> :call vimspector#ClearBreakpoints()<CR>
nmap <F3> <Plug>VimspectorToggleBreakpoint
nmap <F4> <Plug>VimspectorAddFunctionBreakpoint
nmap <F5> <Plug>VimspectorStepOver
nmap <F6> <Plug>VimspectorStepInto
nmap <F7> <Plug>VimspectorStepOut
nmap <F8> <Plug>VimspectorContinue
nmap <F9> <Plug>VimspectorStop
nmap <F10> <Plug>VimspectorRestart
nmap <F11> :VimspectorReset<CR>
