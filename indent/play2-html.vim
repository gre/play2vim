" Vim indent file
" Language:	play2-html
" Maintainer: alswl <alswlx@gmail.com>
" Last Change:	2012/07/25

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1
runtime! indent/html.vim
runtime! indent/html5.vim

setlocal autoindent sw=4 noet
setlocal indentexpr=GetPlay2HtmlIndent()
setlocal indentkeys=*,},<Return>

let s:tags = ['if', 'list', 'else', 'elseif', 'cache', 'form', 'ifError', 'ifErros', 'ifnot', 'errors']

" Only define the function once.
if exists("*GetPlay2HtmlIndent")
  finish
endif

function! GetPlay2HtmlIndent()
  let lnum = prevnonblank(v:lnum-1)
  if lnum == 0
    return 0
  endif
  let line = substitute(getline(lnum),'\s\+$','','')
  let cline = substitute(substitute(getline(v:lnum),'\s\+$','',''),'^\s\+','','')
  let lastcol = strlen(line)
  let line = substitute(line,'^\s\+','','')
  let indent = indent(lnum)
  let cindent = indent(v:lnum)

  let increase_tags_re = ''
  let increase_tags = []
  let decrease_tags_re = ''
  let decrease_tags = []
  for i in s:tags
    call add(increase_tags, '^\s*#{\s*' . i)
    call add(decrease_tags, '^\s*#{\s*/' . i)
  endfor
  let increase_tags_re = join(increase_tags, '\|')
  let decrease_tags_re = join(decrease_tags, '\|')

  if line =~ increase_tags_re
    return indent + &sw
  elseif cline =~ decrease_tags_re
    return indent - &sw
  else
    return HtmlIndentGet(v:lnum)
  endif
endfunction


" vim:set sw=2 et:
