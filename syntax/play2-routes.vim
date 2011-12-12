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


" some basic scala syn
syn match scalaType ":\s*\(=>\s*\)\?[._$a-zA-Z0-9]\+\(\[[^]]*\]\+\)\?\(\s*\(<:\|>:\|#\|=>\)\s*[._$a-zA-Z0-9]\+\(\[[^]]*\]\+\)*\)*"ms=s+1
syn keyword scalaBoolean true false
syn match scalaNumber "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match scalaNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match scalaNumber "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match scalaNumber "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
syn keyword scalaKeyword case catch do else extends final finally for forSome if match new null require return super this throw try type while with yield


syn region routesActionArgs start="(" end=")" contains=routesString,scalaType,scalaNumber,scalaBoolean,scalaKeyword
syn region routesString start=+"+ end=+"+

syn keyword routesHttpMethod GET PUT POST DELETE HEAD
syn region routesMethod start="^[A-Z]\+" end="\s" contains=routesHttpMethod
syn region routesPath   start="\s\+/" end="\s" contains=routesParam
syn region routesAction start="controllers." end="$" contains=routesActionArgs
syn match routesComment "#.*" contains=routesComment

hi link routesHttpMethod  Label
hi link routesPath    Special
hi link routesAction  Underlined
hi link routesParam   Identifier
hi link routesComment Comment
hi link routesString  String

hi link scalaType     Type
hi link scalaBoolean Boolean
hi link scalaNumber Number
hi link scalaKeyword Keyword

let b:current_syntax = "play2-routes"

