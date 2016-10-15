" Vim filetype detect
" Language:	1C (BSL)
" Maintainer:	Andreev Alexander <andreevlex.as@gmail.com>
" Last Change:	15/10/2016
au BufNewFile,BufRead *.bsl,*.os setf bsl

if getline(1) =~ '\c\(Выбрать\|Select\(\s\+Разрешенные\|Allowed\)\?\(\s\+Различные\|Distinct\)\?\(\s\+Первые\|Top\)\)\?.*'
  set ft=sdbl
endif

