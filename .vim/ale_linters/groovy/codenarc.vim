" Author: dansomething
" Description: Codenarc for Groovy files

if !exists('g:ale_groovy_codenarc_options')
    let g:ale_groovy_codenarc_options = '-rulesetfiles=rulesets/basic.xml'
endif

function! ale_linters#groovy#codenarc#Handle(buffer, lines) abort
    let l:pattern = 'Violation: Rule=\([a-zA-Z]\+\) P=\(\d\) Line=\(\d\+\) Msg=\[\(.*\)] Src=\[\(.*\)\]$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:priority = str2nr(l:match[2])
        call add(l:output, {
        \   'type': priority <= 1 ? 'E' : priority > 2 ? 'I' : 'W',
        \   'lnum': l:match[3] + 0,
        \   'text': l:match[4],
        \   'code': l:match[1] . ' `' . l:match[5] . '`'
        \})
    endfor

    return l:output
endfunction

function! ale_linters#groovy#codenarc#GetCommand(buffer) abort
    return 'codenarc '
    \ . ale#Var(a:buffer, 'groovy_codenarc_options')
    \ . ' -report=console'
    \ . ' -basedir=' . expand('#' . a:buffer . ':p:h')
    \ . ' -includes=**/' . expand('#' . a:buffer . ':t')
endfunction

call ale#linter#Define('groovy', {
\   'name': 'codenarc',
\   'executable': 'codenarc',
\   'command': function('ale_linters#groovy#codenarc#GetCommand'),
\   'callback': 'ale_linters#groovy#codenarc#Handle',
\})
