"github/copilot.vim

let g:copilot_filetypes = {
      \ 'gitcommit': v:true,
      \ }

" https://github.com/orgs/community/discussions/12426#discussioncomment-3102062
function! s:SuggestOneCharacter()
  let suggestion = copilot#Accept("")
  let bar = copilot#TextQueuedForInsertion()
  return bar[0]
endfunction

" :help copilot-maps
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
imap <C-k> <Plug>(copilot-accept-word)
imap <script><expr> <C-l> <SID>SuggestOneCharacter()
