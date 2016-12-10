" Vim indent file
" Language:    1C(BSL)
" Maintainer:  Alexander Andreev <andreevlex.as@gmail.com>
" Created:     10/12/2016
" Last Change: 10/12/2016
"

if exists("b:did_indent")
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

let b:did_indent = 1

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal indentexpr=GetBslIndent(v:lnum)
setlocal indentkeys=!^F,o,O

let b:undo_indent = "setl indentkeys< indentexpr<"

if exists("*GetBslIndent")
  finish
endif


function! GetBslIndent(lnum)

  " At the start of the file use zero indent.
  if a:lnum == 0
    return 0
  endif
  
  let prevlnum = prevnonblank(a:lnum-1)
  let previndent = indent(prevlnum)
  
  let cur_text = getline(a:lnum)

  if cur_text =~ '^\s*\/\/' && getline(a:lnum-1) =~ '^\s*\/\/'
    " Comment blocks should have identical indent
    return previndent
  endif

  " COLUMN 1 ALWAYS

  " section headers
  if cur_text =~? '^\s*\(процедура\|procedure\|функция\|function\)\>'
    return 0
  endif
  
  "end procedure or function
  if cur_text =~? '^\s*\%(конец\(процедуры\|функции\)\)\>' 
	\ || cur_text =~? '^\s*\%(end\(procedure\|function\)\)\>'
    return 0
  endif 
  
  " section preproc
  if cur_text =~ '^\s*#.*'
    return 0
  endif
  
  " section define vars
  if cur_text =~? '^\s*\(перем\|var\)\>'
    return 0
  endif

  " Ignore comment lines when calculating indent
    while getline(prevlnum) =~# '^\s*\/\/'
      let prevlnum = prevnonblank(prevlnum-1)
        if !prevlnum
          return previndent
        endif
    endwhile

  let prevline = getline(prevlnum)
  let previndent = indent(prevlnum)
  
  " INCREASE INDENT

  if prevline =~? '\<\(иначе\|else\|тогда\|then\|цикл\|do\|попытка\|try\|исключение\|except\)$'
    return previndent + &shiftwidth
  endif
  
  " DECREASE INDENT

  " Lines starting with "else", but not following line ending with
  " "endif".
  if cur_text =~? '^\s*\(иначе\|else\)\>' && prevline !~? '\<\(конецесли\|endif\);$'
    return previndent - &shiftwidth
  endif

  if cur_text =~? '^\s*\%(конец\(если\|цикла\|попытки\)\);$' 
	  \ || cur_text =~? '^\s*\%(end\(if\|do\|try\)\);$'
    return previndent - &shiftwidth
  endif

  if cur_text =~? '^\s*\(исключение\|except\)$'
    return previndent - &shiftwidth
  endif

  " ____________________________________________________________________

  " If nothing changed, return same indent.
  return previndent
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
" vim:sw=2
