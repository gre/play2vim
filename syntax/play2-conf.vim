" Vim syntax file
" Language:	Play framework 2 - the conf file
" Maintainer:	Gaëtan Renaudeau <gre@zenexity.com>
" URL:		http://github.com/gre/play2vim
" Last Change:	2011 Dec 12
" Fork From:    conf.vim

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match	confComment	"^#.*"
syn match	confComment	"\s#.*"ms=s+1
syn region	confString	start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region	confString	start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

syn match      confKey         "^[^=#]\+="me=e-1
syn match      confValue       "=.*$"ms=s+1 contains=confString,confComment

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link confComment	Comment
hi def link confString	String
hi def link confKey	Identifier
hi def link confValue	Special

let b:current_syntax = "play2-conf"

" vim: ts=8 sw=2
