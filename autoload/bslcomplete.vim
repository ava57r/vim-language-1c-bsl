" Vim completion script
" Language:	1C (BSL)
" Maintainer:	Andreev Alexander <andreevlex.as@gmail.com>
" Last Change:	04/02/2017

function! bslcomplete#Complete(findstart, base)

  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1

    let b:context = strpart( getline('.') , 0 , start + 1 )
    let b:tokens  = split(b:context,'\s\+')
    
    if len(b:tokens)==0
      return -1
    else
      let last_token = remove(b:tokens,-1)
      return col('.')-strlen(last_token)-1
    endif

    return start
  else
    " Initialize base return lists
    let res =  [ ]
    let res2 = [ ]

    let lines = getline(1,'$')

    " Get variables data.
    let variables = filter(copy(lines), 'v:val =~? "\\(перем\\|var\\)\\s"')
    call map(variables, 'matchstr(v:val, "\\c.\\{-}\\(перем\\|var\\)\\s\\+\\zs.*\\ze")')
    call map(variables, 'substitute(v:val, ";\\|$", ",", "g")')
    let vars = []
    " This loop (and next one) is necessary to get variable names from
    " constructs like: var var1, var2, var3 = "something";
    for i in range(len(variables))
      let comma_separated = split(variables[i], ',\s*')
      call map(comma_separated, 'matchstr(v:val, "\\k\\+")')
      let vars += comma_separated
    endfor

    let variables = sort(vars)
    unlet! vars

    " Get functions and procedures
    let functions = filter(copy(lines), 'v:val =~? "^\\s*\\(функция\\|function\\|процедура\\|procedure\\)\\s"')
    let arguments = copy(functions)
    call map(functions, 'matchstr(v:val, "\\c^\\s*\\(функция\\|function\\|процедура\\|procedure\\)\\s\\+\\zs\\k\\+")')
    call map(functions, 'v:val."("')
    let functions = sort(functions)

    " Create table to keep arguments for additional 'menu' info
    let b:bsl_menuinfo = {}
    for i in arguments
      let g:ia = i
      let f_elements = matchlist(i, '\c\(функция\|function\|процедура\|procedure\)\s\+\(\k\+\)\s*(\(.\{-}\))')
      let b:bsl_menuinfo[f_elements[2].'('] = f_elements[3]
    endfor

    let values = variables + functions

    for m in values
      if m =~? '^'.a:base
        call add(res, m)
      elseif m =~? a:base
        call add(res2, m)
      endif
    endfor

    let menu = res + res2
    let final_menu = []
    for i in range(len(menu))
      let item = menu[i]
      if item =~ '($'
        let kind = 'f'
        if has_key(b:bsl_menuinfo, item)
          let m_info = b:bsl_menuinfo[item]
        else
          let m_info = ''
        endif
      else
        let kind = 'v'
        let m_info = ''
      endif
      let final_menu += [{'word':item, 'menu':m_info, 'kind':kind, 'icase':1}]
    endfor

    return final_menu
  endif

endfunction
