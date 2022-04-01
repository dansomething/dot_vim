"AndrewRadev/switch.vim

let g:switch_mapping = "-"

autocmd BufNewFile,BufRead *[Ss]pec.[jt]s,*[Ii]ntegration.[jt]s let g:switch_custom_definitions =
    \ [
    \   {
    \     '^\(\s\+\)\?describe\((\)':  '\1fdescribe\2',
    \     '^\(\s\+\)\?fdescribe\((\)':  '\1xdescribe\2',
    \     '^\(\s\+\)\?xdescribe\((\)':  '\1describe\2',
    \   },
    \   {
    \     '^\(\s\+\)\?it\((\)':  '\1fit\2',
    \     '^\(\s\+\)\?fit\((\)':  '\1xit\2',
    \     '^\(\s\+\)\?xit\((\)':  '\1it\2',
    \   },
    \   [' () =>', ' (done) =>'],
    \ ]

autocmd BufNewFile,BufRead *.md let g:switch_custom_definitions =
    \ [
    \   ['[ ]', '[X]'],
    \ ]
