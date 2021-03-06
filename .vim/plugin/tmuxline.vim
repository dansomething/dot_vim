"edkolev/tmuxline.vim

let g:tmuxline_preset = {
    \ 'a'    : '❐ #S#{?client_prefix, C-a,    }',
    \ 'b'    : '#H',
    \ 'c'    : '#(whoami)',
    \ 'win'  : ['#I', '#W'],
    \ 'cwin' : ['#I', '#W'],
    \ 'x'    : ['%I:%M %p'],
    \ 'y'    : '⚡️#(battery)',
    \ 'z'    : '#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load -a0 --interval 2 -g0)'
    \ }
