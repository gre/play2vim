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
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_play2conf_syn_inits")
  if version < 508
    let did_play2conf_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink confComment Comment
  HiLink confString  String
  HiLink confKey     Identifier
  HiLink confValue   Special

  delcommand HiLink
endif

let b:current_syntax = "play2-conf"

" vim: ts=8 sw=2
