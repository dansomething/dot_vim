" https://github.com/janko-m/vim-test#extending

let test#kotlin#patterns = {
  \ 'test':      ['\v^\s*\@Test fun (\w+)'],
  \ 'namespace': ['\v^\s*class (\w+)'],
\}

if !exists('g:test#kotlin#maventest#file_pattern')
  let g:test#kotlin#maventest#file_pattern = '\v^([Tt]est.*|.*[Tt]est(s|Case)?)\.kt$'
endif

function! test#kotlin#maventest#test_file(file) abort
  return a:file =~? g:test#kotlin#maventest#file_pattern
endfunction

function! test#kotlin#maventest#build_position(type, position) abort
  let filename = fnamemodify(a:position['file'], ':t:r')

  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return ['-Dtest=' . name]
    else
      return ['-Dtest=' . filename]
    endif
  elseif a:type ==# 'file'
    return ['-Dtest=' . filename]
  else
    return []
  endif
endfunction

function! test#kotlin#maventest#build_args(args) abort
  return a:args
endfunction

function! test#kotlin#maventest#executable() abort
  return 'mvn test'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#kotlin#patterns)
  return escape(join(name['namespace'] + name['test'], '#'), '#')
endfunction
