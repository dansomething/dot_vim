"vim-airline/vim-airline

let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail' "'short_path', 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'CMD',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'VB',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" Just show the file name
let g:airline_section_c = '%t'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" The default ⚡️ looks too much like the battery charging symbol
let g:airline_symbols.dirty = ' 𝛥'
