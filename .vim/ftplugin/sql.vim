" Only do this when not yet done for this buffer
if exists('b:did_ftplugin')
  finish
endif

" Set comment format
setlocal commentstring=--\ %s
let b:undo_ftplugin = 'setlocal commentstring<'
