" Vim filetype detect
" Language:	1C (SDBL)
" Maintainer:	Andreev Alexander <andreevlex.as@gmail.com>
" Last Change:	18/12/2016

" Only do the rest when the FileType autocommand has not been triggered yet.
if did_filetype()
  finish
endif

" filetype detect 1C(SDBL)
au BufNewFile,BufRead *.sdbl,*.query set ft=sdbl
