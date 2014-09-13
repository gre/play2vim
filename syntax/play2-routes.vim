" Vim syntax file
" Language:	Play framework 2 - the routes file
" Maintainer:	Gaëtan Renaudeau <gre@zenexity.com>
" URL:		http://github.com/gre/play2vim
" Last Change:	2011 Dec 12

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match routesRegexp "<[^>]\+>"
syn match routesParam  /[:*][A-Za-z0-9]\+/
syn match routesParam  /\($[A-Za-z0-9]\+\)<[^>]\+>/ contains=routesRegexp

syn include @scala syntax/scala.vim

syn region routesActionArgs matchgroup=routesAction start="(" end=")" contains=@scala contained oneline
syn region routesString start=+"+ end=+"+ oneline

syn keyword routesHttpMethod GET PUT PATCH POST DELETE HEAD OPTIONS contained
syn region routesMethod start="^" end=/\s/ contains=routesHttpMethod nextgroup=routesPath skipwhite oneline
syn region routesPath   start="/" end=/\s/ contains=routesParam nextgroup=routesAction skipwhite oneline
syn region routesAction start=/[a-zA-Z]\+\./ end="$" contains=routesActionArgs skipwhite oneline
syn match routesComment "#.*" contains=routesComment

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_play2routes_syn_inits")
  if version < 508
    let did_play2routes_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink routesHttpMethod Statement
  HiLink routesRegexp  Statement
  HiLink routesPath    Special
  HiLink routesAction  Underlined
  HiLink routesParam   Identifier
  HiLink routesComment Comment
  HiLink routesString  String

  delcommand HiLink
endif

let b:current_syntax = "play2-routes"

