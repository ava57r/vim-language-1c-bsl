" Vim syntax file
" Language:	1C (SDBL)
" Maintainer:	Alexander Andreev <andreevlex.as@gmail.com>
" Last Change:	19/10/2016
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore
syn sync lines=250

syn match   keyword_operator_punctuation_sdbl  "[,;]"
syn match   keyword_operator_sdbl              "[-+/*%=<>]"
syn region  comment_line_double_slash_sdbl     start="//" end="$"
syn region  string_quoted_double_sdbl          start=+\"+ end=+\"\(["]\)\@!+ contains=constant_character_escape_sdbl,comment_line_double_slash_sdbl
syn match   constant_character_escape_sdbl     +\"\"+
syn match   constant_language_sdbl             "\([^.]\@<=\|^\)\<\(Неопределено\|Undefined\|Истина\|True\|Ложь\|False\|NULL\)\>\([^.]\@=\|$\)"
syn match   constant_numeric_bsl               "-\=\<\d\+\>"
syn match   constant_float_bsl                 "-\=\<\d\+\.\d\+\>"
syn match   variable_parameter_sdbl "\(&[a-z0-9_а-яё]\+\)"
syn match   keyword_control_conditional_sdbl  "\([^.]\@<=\|^\)\<\(Выбор\|Case\|Когда\|When\|Тогда\|Then\|Иначе\|Else\|Конец\|End\)\>\([^.]\@=\|$\)" 
syn match   keyword_operator_logical_sdbl      "\(\(КАК\s\|AS\s\)\@<!\)\([^.]\@<=\|^\)\<\(НЕ\|NOT\|И\|AND\|ИЛИ\|OR\|В\s\+ИЕРАРХИИ\|IN\s\+HIERARCHY\|В\|In\|Между\|Between\|Есть\sNULL\|Is\s\+NULL\|Ссылка\|Refs\|Подобно\|Like\)\>\([^.]\@=\|$\)" 
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(Выбрать\|Select\|Разрешенные\|Allowed\|Различные\|Distinct\|Первые\|Top\|Как\|As\|ПустаяТаблица\|EpmtyTable\|Поместить\|Into\|Уничтожить\|Drop\|Из\|From\)\>\([^.]\@=\|$\)"
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(\(Левое\|Left\|Правое\|Right\|Полное\|Full\)\s\+\(Внешнее\s\+\|Outer\s\+\)\?Соединение\|Join\)\>\([^.]\@=\|$\)"
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(\(Внутреннее\s\+\|Inner\s\+\)\?Соединение\|Join\)\>\([^.]\@=\|$\)"
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(Где\|Where\|Сгруппировать\s\+По\|Group\s\+By\|Имеющие\|Having\)\>\([^.]\@=\|$\)"
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(Объединить\(\s\+Все\)\?\|Union\(\s\+All\)\?\)\>\([^.]\@=\|$\)"
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(Упорядочить\s\+По\|Order\s\+By\|Автоупорядочивание\|Autoorder\|Итоги\|Totals\)\>\([^.]\@=\|$\)"
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(По\(\s\+Общие\)\?\|By\(\s\+Overall\)\?\|\(Только\s\+\)\?Иерархия\|\(Only\s\+\)\?Hierarchy\)\>\([^.]\@=\|$\)"
syn match keyword_control_sdbl "\([^.]\@<=\|^\)\<\(Периодами\|Periods\|Индексировать\|Index\|Выразить\|Cast\|Возр\|Asc\|Убыв\|Desc\|Для\s\+Изменения\|For\s\+Update\(\s\+Of\)\?\|Спецсимвол\|Escape\)\>\([^.]\@=\|$\)"

"Функции языка запросов
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Значение\|Value\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(ДатаВремя\|DateTime\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Тип\|Type\)\>\s*\((\@=\)"

"Функции работы со строками
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Подстрока\|Substring\)\>\s*\((\@=\)"

"Функции работы с датами
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Год\|Year\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Квартал\|Quarter\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Месяц\|Month\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(ДеньГода\|DayOfYear\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(День\|Day\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Неделя\|Week\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(ДеньНедели\|Weekday\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Час\|Hour\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Минута\|Minute\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Секунда\|Second\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(НачалоПериода\|BeginOfPeriod\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(КонецПериода\|EndOfPeriod\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(ДобавитьКДате\|DateAdd\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(РазностьДат\|DateDiff\)\>\s*\((\@=\)"

"Агрегатные функции
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Сумма\|Sum\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Среднее\|Avg\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Минимум\|Min\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Максимум\|Max\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Количество\|Count\)\>\s*\((\@=\)"

"Прочие функции
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(ЕстьNULL\|IsNULL\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(Представление\|Presentation\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(ПредставлениеСсылки\|RefPresentation\)\>\s*\((\@=\)"
syn match support_function_sdbl "\([^.]\@<=\|^\)\<\(ТипЗначения\|ValueType\)\>\s*\((\@=\)"

syn match support_type_sdbl "\([^.]\@<=\|^\)\<\(Число\|Number\|Строка\|String\|Дата\|Date\)\>\([^.]\@=\|$\)"


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sdbl_syn_inits")
  if version < 508
    let did_sdbl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

HiLink keyword_operator_punctuation_sdbl          Operator
HiLink keyword_operator_sdbl                      Operator
HiLink comment_line_double_slash_sdbl             Comment
HiLink string_quoted_double_sdbl                  String
HiLink constant_language_sdbl                     Constant
HiLink constant_numeric_bsl                       Number
HiLink constant_float_bsl                         Float
HiLink keyword_control_conditional_sdbl           Conditional
HiLink keyword_operator_logical_sdbl              Operator
HiLink keyword_control_sdbl                       Statement
HiLink support_function_sdbl                      Function
HiLink support_type_sdbl                          Type
HiLink variable_parameter_sdbl                    Identifier

delcommand HiLink
endif

let b:current_syntax = "sdbl"



