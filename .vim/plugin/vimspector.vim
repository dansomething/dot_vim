" https://github.com/puremourning/vimspector

let g:vimspector_sidebar_width = 100 " default 50
" let g:vimspector_code_minwidth = 85 " default 82
" let g:vimspector_terminal_minwidth = 75 " default 8"

nmap <F2> :call vimspector#ClearBreakpoints()<CR>
nmap <F3> <Plug>VimspectorToggleBreakpoint
nmap <F4> <Plug>VimspectorAddFunctionBreakpoint
nmap <F5> <Plug>VimspectorStepOver
nmap <F6> <Plug>VimspectorStepInto
nmap <F7> <Plug>VimspectorStepOut
nmap <F8> <Plug>VimspectorContinue
nmap <F9> <Plug>VimspectorStop
nmap <F11> <Plug>VimspectorRestart
nmap <F12> :call vimspector#Reset()<CR>

function! s:CustomizeVimspectorUI()
  " Close the output window
  call win_gotoid(g:vimspector_session_windows.output)
  q
endfunction

function s:SetupVimspectorTerminal()
  " Customize the terminal window size/position
  " For some reasons terminal buffers in Neovim have line numbers
  call win_gotoid(g:vimspector_session_windows.terminal)
  set norelativenumber nonumber
endfunction

augroup MyVimspectorUICustomization
  autocmd!
  autocmd User VimspectorUICreated call s:CustomizeVimspectorUI()
  autocmd User VimspectorTerminalOpened call s:SetupVimspectorTerminal()
augroup END
