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

syn match routesParam ":[A-Za-z0-9]\+"
syn match routesParam "*[A-Za-z0-9]\+"
syn match routesRegexp "<[^>]\+>"
syn match routesParam "\($[A-Za-z0-9]\+\)<[^>]\+>" contains=routesRegexp

syn include @scala syntax/scala.vim

syn region routesActionArgs start="(" end=")" contains=@scala
syn region routesString start=+"+ end=+"+ oneline

syn keyword routesHttpMethod GET PUT POST DELETE HEAD
syn region routesMethod start="^" end="\s" contains=routesHttpMethod nextgroup=routesPath skipwhite oneline
syn region routesPath   start="/" end="\s" contains=routesParam nextgroup=routesAction skipwhite oneline
syn region routesAction start="[a-zA-Z]\+\." end="$" contains=routesActionArgs oneline
syn match routesComment "#.*" contains=routesComment

hi def link routesHttpMethod Normal 
hi def link routesRegexp  Statement
hi def link routesPath    Special
hi def link routesAction  Underlined
hi def link routesParam   Identifier
hi def link routesComment Comment
hi def link routesString  String

let b:current_syntax = "play2-routes"

