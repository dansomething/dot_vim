" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" Vundle
" ---------------
command! ReloadVundle source ~/.vim/vundle.vim
function! PluginReloadAndRun(command)
  :ReloadVundle
  execute a:command
endfunction

nnoremap <Leader>pi :call PluginReloadAndRun("PluginInstall")<CR>
nnoremap <Leader>pu :call PluginReloadAndRun("PluginInstall!")<CR>
nnoremap <Leader>pc :call PluginReloadAndRun("PluginClean")<CR>

" -------
" Eclim
" -------
let g:EclimCompletionMethod='omnifunc'
nnoremap <Leader>ef :JavaFormat<CR>
nnoremap <Leader>ei :JavaImport<CR>
nnoremap <Leader>eio :JavaImportOrganize<CR>
nnoremap <Leader>eg :JavaSearchContext<CR>
nnoremap <Leader>et :JavaHierarchy<CR>
nnoremap <Leader>er :JavaRename
nnoremap <Leader>ej :JUnit<CR>
nnoremap <Leader>ejf :JUnit %<CR>
nnoremap <Leader>ec :JavaCorrect<CR>
nnoremap <Leader>esr :JavaSearch -x references -s all<CR>
nnoremap <Leader>eot :JavaSearch -t type -s all -p
nnoremap <Leader>eor :LocateFile<CR>
nnoremap <Leader>ep :ProjectProblems!<CR>
nnoremap <Leader>era :ProjectRefreshAll<CR>
nnoremap <Leader>eo :JavaImpl<CR>

" Disable autocmoplete scratch buffer
set completeopt-=preview
set completeopt+=longest

"------------
" EasyMotion
"------------
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

nmap <Leader>s <Plug>(easymotion-sn)

" ---------------
" space.vim
" ---------------
" Disables space mappings in select mode to fix snipMate.
let g:space_disable_select_mode = 1

" ---------------
" Syntastic
" ---------------
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['scss'] }

" Hat tip http://git.io/SPIBfg
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1

" Platform-specific config files
if has('win32') || has('win64')
  let g:syntastic_jsl_conf=$HOME.'/.vim/config/windows/syntastic/jsl.conf'
  let g:syntastic_disabled_filetypes=['sh'] " Disable .sh on Windows
else
  let g:syntastic_javascript_jsl_conf=$HOME.'/.vim/config/unix/syntastic/jsl.conf'
endif

" ---------------
" Tags
" ---------------
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 1

" ---------------
" Tagbar
" ---------------
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>ta :TagbarOpenAutoClose<CR>
let g:tagbar_compact = 1
let g:tagbar_width = 60

let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }

let g:tagbar_type_cucumber = {
    \ 'ctagstype': 'cucumber',
    \ 'kinds': [
        \'d:definition'
      \]
    \}

let g:tagbar_type_less = {
    \ 'ctagstype' : 'less',
    \ 'kinds'     : [
        \ 'c:class',
        \ 'i:id',
        \ 'm:media',
        \ 't:tag',
        \ 'v:variables',
    \ ]
\ }

" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 40
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2 " Change the NERDTree directory to the root node
let g:NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" ---------------
" Session
" ---------------
let g:session_autosave = 0
let g:session_autoload = 0
nnoremap <leader>os :OpenSession<CR>

" ---------------
" Tabular
" ---------------
nnoremap <Leader>t& :Tabularize /&<CR>
vnoremap <Leader>t& :Tabularize /&<CR>
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:<CR>
vnoremap <Leader>t: :Tabularize /:<CR>
nnoremap <Leader>t:: :Tabularize /:\zs<CR>
vnoremap <Leader>t:: :Tabularize /:\zs<CR>
nnoremap <Leader>t, :Tabularize /,<CR>
vnoremap <Leader>t, :Tabularize /,<CR>
nnoremap <Leader>t,, :Tabularize /,\zs<CR>
vnoremap <Leader>t,, :Tabularize /,\zs<CR>
nnoremap <Leader>t<Bar> :Tabularize /<Bar><CR>
vnoremap <Leader>t<Bar> :Tabularize /<Bar><CR>

" ---------------
" Fugitive
" ---------------
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog --graph --pretty=oneline --abbrev-commit -n 20<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1

" ---------------
" Zoomwin
" ---------------
" Zoom Window to Full Size
nnoremap <silent> <leader>wo :ZoomWin<CR>

" ---------------
" ctrlp.vim
" ---------------
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''
" Default to filename mode
let g:ctrlp_by_filename = 1
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:ctrlp_show_hidden = 1
" Fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0
autocmd FileType coffee let g:switch_custom_definitions =
    \ [
    \   {
    \     '^\(\s\+\)\?describe \(''[^'']\+''\)':  '\1xdescribe \2',
    \     '^\(\s\+\)\?xdescribe \(''[^'']\+''\)':  '\1describe.only \2',
    \     '^\(\s\+\)\?describe.only \(''[^'']\+''\)':  '\1describe \2',
    \   },
    \   {
    \     '^\(\s\+\)xit \(''[^'']\+''\)':  '\1it.only \2',
    \     '^\(\s\+\)it.only \(''[^'']\+''\)':  '\1it \2',
    \     '^\(\s\+\)it \(''[^'']\+''\)':  '\1xit \2',
    \   },
    \   [' ->', ' =>', ' (done) ->', ' (done) =>'],
    \ ]

" Leader Commands
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ---------------
" airline
" ---------------
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline_mode_map = {
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ 'c'  : 'CMD',
      \ '' : 'VB',
      \ }
" Just show the file name
let g:airline_section_c = '%t'

" ---------------
" jellybeans.vim colorscheme tweaks
" ---------------
" Make cssAttrs (center, block, etc.) the same color as units
hi! link cssAttr Constant

" ------------------------------------
" Rainbow parens (solarized palette)
" ------------------------------------
let g:rbpt_max = 8
let g:rbpt_colorpairs = [
    \ ['136',  '#b58900'],
    \ ['61',   '#6c71c4'],
    \ ['166',  '#cb4b16'],
    \ ['33',   '#268bd2'],
    \ ['160',  '#dc322f'],
    \ ['37',   '#2aa198'],
    \ ['125',  '#d33682'],
    \ ['64',   '#859900'],
    \ ]

" ---------------
" Ag.vim
" ---------------
nnoremap <silent> <leader>as :AgFromSearch<CR>
nnoremap <leader>ag :Ag<space>
vnoremap <leader>ag "xy :Ag "<c-r>x"
nnoremap <leader>sag :Ag <c-r><c-w>

" ---------------
" surround.vim
" ---------------
" Use # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" Thanks to http://git.io/_XqKzQ
let g:surround_35  = "#{\r}"

" ------------
" sideways.vim
" ------------
noremap gs :SidewaysRight<cr>
noremap gS :SidewaysLeft<cr>

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" ---------------
" switch.vim
" ---------------
nnoremap - :Switch<cr>

" ---------------
" indenthtml
" ---------------
" Setup indenthtml to propertly indent html. Without this, formatting doesn't
" work on html.
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" ---------------
" Unconditional Paste
" ---------------
let g:UnconditionalPaste_NoDefaultMappings = 1
nnoremap gcP <Plug>UnconditionalPasteCharBefore
nnoremap gcp <Plug>UnconditionalPasteCharAfter

" ---------------
" MatchTagAlways
" ---------------
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'handlebars' : 1,
    \ 'eruby' : 1,
    \}

" ----------
" SuperTab
" ----------
let g:SuperTabClosePreviewOnPopupClose = 1

" ---------------
" YouCompleteMe
" ---------------
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" ---------------
" Ultisnips
" ---------------
let g:UltiSnipsExpandTrigger="<leader><Enter>"
let g:UltiSnipsListSnippets="<leader><tab>"

" ---------------
" vim-signify
" ---------------
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle_highlight="<nop>"
let g:signify_mapping_toggle="<nop>"
" Makes switching buffers in large repos have no delay
let g:signify_update_on_bufenter = 0
let g:signify_sign_overwrite = 0

" ---------------
" vim-startify
" ---------------
let g:startify_list_order = [
        \ ['   Last modified'],
        \ 'dir',
        \ ['   Recent'],
        \ 'files',
        \ ]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ 'bundle/.*/doc',
            \ ]
let g:startify_files_number = 10
let g:startify_custom_indices = ['a', 'd', 'f', 'g', 'h']
let g:startify_change_to_dir = 0

hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=111
hi StartifyHeader  ctermfg=203
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240

" ---------------
" vim-abolish
" ---------------
nnoremap <leader>su :Subvert/
nnoremap <leader>ss :%Subvert/

" ---------------
" vim-togglecursor
" ---------------
let g:togglecursor_leave='line'

" ------
" ColorV
" ------
let g:colorv_preview_ftype = 'css,html,javascript,scss,stylus,less'

"---------
" Clojure
"---------
nnoremap <silent> <leader>sh :Slamhound<CR>

"-------------
" CoffeeScript
"-------------
nnoremap <silent> <leader>vc :CoffeeWatch vert<CR>

"-------
" Tasks
"-------
nnoremap <silent> <leader>tx :call Toggle_task_status()<CR>
vnoremap <silent> tx :call Toggle_task_status()<CR>

"------
" Dash
"------
nmap <silent> <leader>d <Plug>DashSearch
" Make CoffeeScript use the same docsets as JavaScript
let g:dash_map = {
    \ 'coffee' :  ['coffee', 'javascript', 'jquery', 'jqueryui', 'jquerym', 'angularjs', 'backbone', 'marionette', 'meteor', 'sproutcore', 'moo', 'prototype', 'bootstrap', 'foundation', 'lodash', 'underscore', 'ember', 'sencha', 'extjs', 'titanium', 'knockout', 'zepto', 'yui', 'd3', 'svg', 'dojo', 'coffee', 'nodejs', 'express', 'grunt', 'mongoose', 'moment', 'require', 'awsjs', 'jasmine', 'sinon', 'chai', 'html', 'css', 'cordova', 'phonegap', 'unity3d'],
    \ 'less' : 'css'
    \ }
