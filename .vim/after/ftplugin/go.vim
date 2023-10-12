setlocal listchars+=tab:\ \ 

if exists(":Rg")
  " Find all types which implement the interface name under the cursor.
  nnoremap <leader>gI :Rg ^func (.*) <C-R><C-W><CR>

  " Find the type definition for the name under the cursor.
  nnoremap <leader>gT :Rg ^type <C-R><C-W> <CR>
endif
