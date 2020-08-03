" https://github.com/janko-m/vim-test#extending

let g:test#groovy#patterns = {
  \ 'test':      ['\v^\s*%(public void (\w+)|def\s*(".*"))'],
  \ 'namespace': ['\v^\s*%(public )?class (\w+)'],
\}

if !exists('g:test#groovy#maventest#file_pattern')
  let g:test#groovy#maventest#file_pattern = '\v^([Tt]est.*|.*[Tt]est(s|Case)?|.*[Ss]pec)\.groovy'
endif

function! test#groovy#maventest#test_file(file) abort
  return a:file =~? g:test#groovy#maventest#file_pattern
endfunction

function! test#groovy#maventest#build_position(type, position) abort
  let filename = fnamemodify(a:position['file'], ':t:r')
  let package = s:get_groovy_package(a:position['file'])
  let module = s:get_maven_module(a:position['file'])
  " ex:  mvn test -Dtest com.you.pkg.App$NestedClass#test_method
  " ex:  mvn test -Dtest com.you.pkg.App#test_method
  " ex:  mvn test -Dtest com.you.pkg.App\*           (catches nested test-classes)
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return ['-Dtest=' . package . '.' . name. module]
    else
      return ['-Dtest=' . package . '.' . filename . '\*'. module]
    endif

  " ex:  mvn test -Dtest com.you.pkg.App\*  (catches nested test-classes)
  elseif a:type ==# 'file'
    return ['-Dtest=' . package . '.' . filename . '\*'. module]

  " ex:  mvn test
  else
    return [module]
  endif
endfunction

function! test#groovy#maventest#build_args(args) abort
  return a:args
endfunction

function! test#groovy#maventest#executable() abort
  return 'mvn test'
endfunction

function! s:get_groovy_package(filepath)
  " abspath to sourcefile
  let abspath = fnamemodify(a:filepath, ':p')
  let abspath = substitute(a:filepath, '\\', '/', 'g')

  " strip path-to-project and maven-boilerplate dir-structure
  let relpath = substitute(abspath, '^.*src/\(main\|test\)/\(java\|groovy\)/', "", "g")
  let package_path = substitute(relpath, '\/[^/]\+$', "", "g")
  let groovy_package = substitute(package_path, '/', '.', 'g')
  return groovy_package
endfunction

function! s:get_maven_module(filepath)
  let project_dir = GetGroovyProjectDirectory(a:filepath)
  let l:module_name = fnamemodify(project_dir, ':t')
  let l:parent = fnamemodify(project_dir, ':p:h:h')
  if filereadable(l:parent. "/pom.xml") " check if the parent dir has pom.xml
      return ' -pl '. module_name
  else
      return ''
  endif
endfunction

function! GetGroovyProjectDirectory(filepath)
    let pomFile = s:GetPomFile(a:filepath)
    if strlen(l:pomFile) > 0
        return fnamemodify(l:pomFile, ':h')
    else
        return 0
    endif
endfunction

function! s:GetPomFile(pwd)
    if a:pwd ==# "\/"
        return 0
    else
        let l:fn = a:pwd . "/pom.xml"

        if filereadable(expand(l:fn))
            return l:fn
        else
            let l:parent = fnamemodify(a:pwd, ':h')
            return s:GetPomFile(l:parent)
        endif
    endif
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#groovy#patterns)
  return escape(join(name['namespace'] + name['test'], '#'), '#')
endfunction
