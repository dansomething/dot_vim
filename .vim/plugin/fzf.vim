"junegunn/fzf.vim

" Enable floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" https://github.com/junegunn/fzf/wiki/Examples-(vim)#simple-mru-search
command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

" Leader Commands (to match my old ctrlp habits)
nnoremap <leader>t :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>u :History<CR>
nnoremap <leader>m :FZFMru<CR>
nnoremap // :BLines<CR>

" bind leader ag to open a search prompt
nnoremap <leader>ag :Rg 
" bind leader gf to list files changed with a diff
nnoremap <leader>gf :GFiles?<CR>
" bind ag to grep word under cursor
vnoremap <leader>ag "xy :Rg <C-R>x
" bind K to grep highlighted text
vnoremap <leader>k "xy :Rg <C-R>x<CR>
" bind K to grep word under cursor
nnoremap <leader>k :Rg <C-R><C-W><CR>

" https://github.com/junegunn/fzf.vim#advanced-customization
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
