"mhinz/vim-signify

let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 1
let g:signify_priority = 0 " default is 10

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)
