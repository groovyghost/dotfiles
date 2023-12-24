" Vim filetype plugin
" Language:		JSON

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = 'setlocal formatoptions< comments< commentstring<'

setlocal formatoptions-=t

" JSON has no comments.
setlocal comments=
setlocal commentstring=
