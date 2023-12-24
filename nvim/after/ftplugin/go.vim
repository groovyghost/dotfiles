" Vim filetype plugin file
" Language:	Go

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t

setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

let b:undo_ftplugin = 'setl fo< com< cms<'

" vim: sw=2 sts=2 et
