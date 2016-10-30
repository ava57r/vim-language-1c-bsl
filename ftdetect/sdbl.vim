" Vim filetype detect
" Language:	1C (SDBL)
" Maintainer:	Andreev Alexander <andreevlex.as@gmail.com>
" Last Change:	30/10/2016

" Only do the rest when the FileType autocommand has not been triggered yet.
if did_filetype()
  finish
endif

" filetype detect 1C(SDBL)
au BufNewFile,BufRead *.sdbl set ft=sdbl
au BufNewFile,BufRead *.*  call s:FTsdblsyntax()

func! s:FTsdblsyntax()
  if exists("g:filetype_sdbl_anyfile")
    if getline(1) =~ '^\v\cВыбрать|Select(\s+Разрешенные|\s+Allowed)?(\s+Различные|\s+Distinct)?(\s+Первые|\s+Top)?'
      set ft=sdbl
    endif
  endif
endfunc


