" Vim syntax file
" Language:	Play2 Text scala template
" Maintainer:	Gaëtan Renaudeau <gre@zenexity.com>
" URL:		http://github.com/gre/play2vim
" Last change:	2011 December 14

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn include @scala syntax/scala.vim

syn match phExprIdentifier "#"                nextgroup=phExpr
syn match phExprIdentifier "@"                nextgroup=phExpr
syn match phExprIdentifier /@[A-Za-z0-9._]\+/ nextgroup=phExpr
syn match phExprIdentifier /@[A-Za-z0-9._]\+\s\+match\s*/ nextgroup=phExpr
syn region phComment start=/^\s*\*{/ end=/}\*\s*$/
syn region phComment start=/@[*]/ end=/[*]@/
syn match phOverrided      "@@"

syn region phExpr matchgroup=phExprIdentifier start="("  end=")"  contains=@scala,phExpr contained nextgroup=phExpr
syn region phExpr matchgroup=phExprIdentifier start="{"  end="}"  contains=@scala,phExpr contained nextgroup=phExpr
syn region phExpr matchgroup=phExprIdentifier start="\[" end="\]" contains=@scala,phExpr contained nextgroup=phExpr

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_play2text_syn_inits")
  if version < 508
    let did_play2text_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink phExprIdentifier Identifier
  HiLink phComment	  Comment
  HiLink phOverrided      Default

  delcommand HiLink
endif

let b:current_syntax = "play2-text"
