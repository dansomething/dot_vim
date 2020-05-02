"jszakmeister/vim-togglecursor

let g:togglecursor_leave='line'

" Fix toggle cursor for Vim in Tmux though not when running Alacritty
if $TERM == 'xterm-256color'
    let g:togglecursor_force = 'xterm'
endif
