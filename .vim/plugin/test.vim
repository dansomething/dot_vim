" https://github.com/janko-m/vim-test

let g:test#strategy = "dispatch"
let g:test#custom_runners = {}

nnoremap <leader>xt :TestNearest<CR>
nnoremap <leader>xtf :TestFile<CR>
nnoremap <leader>xtl :TestLast<CR>
