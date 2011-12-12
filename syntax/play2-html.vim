" Vim syntax file
" Language:	JSP (Java Server Pages)
" Maintainer:	Rafael Garcia-Suarez <rgarciasuarez@free.fr>
" URL:		http://rgarciasuarez.free.fr/vim/syntax/jsp.vim
" Last change:	2004 Feb 02
" Credits : Patch by Darren Greaves (recognizes <jsp:...> tags)
"	    Patch by Thomas Kimpton (recognizes jspExpr inside HTML tags)

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'play2-html'
endif

" Source HTML syntax
if version < 600
  source <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
endif
unlet b:current_syntax

syn include @scala syntax/scala.vim

syn region phExpr       start=/@[A-Za-z0-9.]\+/  keepend end=//  nextgroup=phExprNextGroup contains=@scala
syn region phScriptlet  start=/@(/  keepend end=/)/ nextgroup=phGroup contains=@scala
syn region phScriptlet  start=/@{/  keepend end=/}/ nextgroup=phGroup contains=@scala
syn region phExprNextGroup  start=/(/  keepend end=/)/ contains=@scala
syn region phComment    start=/@[*]/	      end=/[*]@/
syn region htmlTag start=+<[^/%]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,phExpr

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_jsp_syn_inits")
  if version < 508
    let did_jsp_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  Hi     phExpr          Special
  HiLink phComment	 Comment
  
  delcommand HiLink
endif

if main_syntax == 'play2-html'
  unlet main_syntax
endif

let b:current_syntax = "play2-html"

" vim: ts=8
