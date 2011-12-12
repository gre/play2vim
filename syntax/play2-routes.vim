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

syn keyword routesHttpMethod GET PUT POST DELETE HEAD
syn region routesMethod start="^[A-Z]\+" end="\s" contains=routesHttpMethod
syn region routesPath   start="\s\+/" end="\s" contains=routesParam
syn region routesAction start="controllers." end="$"
syn match routesComment "#.*" contains=routesComment

hi link routesHttpMethod  Label
hi link routesPath    Special
hi link routesAction  Underlined
hi link routesParam   Identifier
hi link routesComment Comment

let b:current_syntax = "play2-routes"

