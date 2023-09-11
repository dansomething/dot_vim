"w0rp/ale

" Only use COC.nvim for now
let g:ale_disable_lsp = 1
let g:ale_completion_enabled = 0

let g:ale_lint_on_enter = 1
" After open only validate on save
let g:ale_lint_on_text_changed = 'never'

let g:airline#extensions#ale#enabled = 0

" Use standard vim diagnostics for better coc.nvim compatibility
let g:ale_use_neovim_diagnostics_api = 0 " default has('nvim-0.6')

" Only show virtualtext on current line. matches coc.nvim config
let g:ale_virtualtext_cursor = 'current' " default 'all' (if supported, otherwise 'disabled')

let g:ale_sign_priority = 5 " default 30
let g:ale_sign_info = 'i'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format= '%linter% | %code% | %s'
