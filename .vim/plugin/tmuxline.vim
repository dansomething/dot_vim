"edkolev/tmuxline.vim

let g:tmuxline_theme = 'airline'

" Disable when not needed to avoid conflict with tmux plugin manager.
" https://github.com/edkolev/tmuxline.vim/issues/46
let g:airline#extensions#tmuxline#enabled = 0

let g:tmuxline_preset = {
    \ 'a'    : '❐ #S#{tmux_mode_indicator}',
    \ 'b'    : '#H',
    \ 'c'    : '#(whoami)',
    \ 'win'  : ['#I', '#W'],
    \ 'cwin' : ['#I', '#W'],
    \ 'x'    : ['%I:%M %p'],
    \ 'y'    : '#{battery_icon_status} #{battery_percentage}',
    \ 'z'    : '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -a0 -g0 -i2)'
    \ }
