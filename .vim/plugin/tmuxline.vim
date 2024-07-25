"edkolev/tmuxline.vim

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
