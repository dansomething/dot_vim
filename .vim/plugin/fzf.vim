"junegunn/fzf.vim

" Enable fzf history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Enable floating window
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '90%,70%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif
let g:coc_fzf_preview  = 'right:50%:hidden'

" Windows/Mintty doesn't support this option.
if has('win32unix')
  let g:fzf_preview_window=''
else
   let g:fzf_preview_window = [g:coc_fzf_preview, '?']
endif

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

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
nnoremap <leader>M :Maps<CR>
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
