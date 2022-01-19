"tpope/vim-fugitive

nnoremap <Leader>gb :Git blame<CR>
" Open commit in a new tab
nnoremap <Leader>gc :Git commit -v<CR>
nnoremap <Leader>gmt :Git mergetool<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gpf :Git push --force-with-lease<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiffsplit<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <Leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1

nnoremap <Leader>gs :Git<CR>
