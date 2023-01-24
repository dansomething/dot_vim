"edkolev/tmuxline.vim

let g:tmuxline_preset = {
    \ 'a'    : '❐ #S#{?client_prefix, WAIT,     }',
    \ 'b'    : '#H',
    \ 'c'    : '#(whoami)',
    \ 'win'  : ['#I', '#W#{?pane_synchronized,  ,}'],
    \ 'cwin' : ['#I', '#W#{?pane_synchronized,  ,}'],
    \ 'x'    : ['%I:%M %p'],
    \ 'y'    : '⚡️#(battery)',
    \ 'z'    : '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -a0 --interval 2 -g0)'
    \ }
