" Vim syntax file
" Language:	1C (SDBL)
" Maintainer:	Alexander Andreev <andreevlex.as@gmail.com>
" Last Change:	03/12/2016
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

syn match   sdblOperatorPunctuation        display "[,;]"
syn match   sdblOperator                   display "[-+/*%=<>]"
syn region  sdblCommentLineDoubleSlash     start="//" end="$"
syn region  sdblStringQuotedDouble         start=+\"+ end=+\"\(["]\)\@!+ contains=sdblConstantCharacterEscape,sdblCommentLineDoubleSlash
syn match   sdblConstantCharacterEscape    +\"\"+
syn keyword sdblConstantLanguage           Неопределено Истина Ложь
syn keyword sdblConstantLanguage           Undefined True False NULL
syn match   sdblConstantNumeric            display "-\=\<\d\+\>"
syn match   sdblConstantFloat              display "-\=\<\d\+\.\d\+\>"
syn match   sdblVariableParameter          "\(&[a-z0-9_а-яё]\+\)"
syn keyword sdblKeywordControlConditional  Выбор Когда Тогда Иначе Конец
syn keyword sdblKeywordControlConditional  Case When Then Else End
syn keyword sdblKeywordOperatorLogical     НЕ И ИЛИ В Между Подобно
syn keyword sdblKeywordOperatorLogical     NOT AND OR In Between Like
syn match   sdblKeywordOperatorLogical     "\<\%(В\s\+ИЕРАРХИИ\|IN\s\+HIERARCHY\|Есть\(\s\+НЕ\)\?\s\+NULL\|Is\(\s\+NOT\)\?\s\+NULL\)\>"
syn match   sdblKeywordOperatorLogical     "\([^.]\@<=\|^\)\<\(Ссылка\|Refs\)\>\([^.]\@=\|$\)"
syn keyword sdblKeywordControl             Выбрать Разрешенные Различные Первые Как ПустаяТаблица Поместить Уничтожить Из
syn keyword sdblKeywordControl             Select Allowed Distinct Top As EpmtyTable Into Drop From
syn match   sdblKeywordControl             "\<\%(\(Левое\|Left\|Правое\|Right\|Полное\|Full\)\s\+\(Внешнее\s\+\|Outer\s\+\)\?Соединение\|Join\)\>"
syn match   sdblKeywordControl             "\<\%(\(Внутреннее\|Inner\)\s\+Соединение\|Join\)\>"
syn keyword sdblKeywordControl             Где Имеющие
syn keyword sdblKeywordControl             Where Having
syn match   sdblKeywordControl             "\<\(Сгруппировать\s\+По\|Group\s\+By\)\>"
syn match   sdblKeywordControl             "\<\%(Объединить\(\s\+Все\)\?\|Union\(\s\+All\)\?\)\>"
syn keyword sdblKeywordControl             Автоупорядочивание Итоги
syn keyword sdblKeywordControl             Autoorder Totals
syn match   sdblKeywordControl             "\<\(Упорядочить\s\+По\|Order\s\+By\)\>"
syn match   sdblKeywordControl             "\<\%(По\(\s\+Общие\)\?\|By\(\s\+Overall\)\?\|\(Только\s\+\)\?Иерархия\|\(Only\s\+\)\?Hierarchy\)\>"
syn keyword sdblKeywordControl             Периодами Индексировать Выразить Возр Убыв Спецсимвол
syn keyword sdblKeywordControl             Periods Index Cast Asc Desc Escape
syn match   sdblKeywordControl             "\<\%(Для\s\+Изменения\|For\s\+Update\(\s\+Of\)\?\)\>"

"Функции языка запросов
syn keyword sdblNameSupportFunction contained Значение Value
syn keyword sdblNameSupportFunction contained ДатаВремя DateTime
syn keyword sdblNameSupportFunction contained Тип Type

"Функции работы со строками
syn keyword sdblNameSupportFunction contained Подстрока Substring

"Функции работы с датами
syn keyword sdblNameSupportFunction contained Год Year
syn keyword sdblNameSupportFunction contained Квартал Quarter
syn keyword sdblNameSupportFunction contained Месяц Month
syn keyword sdblNameSupportFunction contained ДеньГода DayOfYear
syn keyword sdblNameSupportFunction contained День Day
syn keyword sdblNameSupportFunction contained Неделя Week
syn keyword sdblNameSupportFunction contained ДеньНедели Weekday
syn keyword sdblNameSupportFunction contained Час Hour
syn keyword sdblNameSupportFunction contained Минута Minute
syn keyword sdblNameSupportFunction contained Секунда Second
syn keyword sdblNameSupportFunction contained НачалоПериода BeginOfPeriod
syn keyword sdblNameSupportFunction contained КонецПериода EndOfPeriod
syn keyword sdblNameSupportFunction contained ДобавитьКДате DateAdd
syn keyword sdblNameSupportFunction contained РазностьДат DateDiff

"Агрегатные функции
syn keyword sdblNameSupportFunction contained Сумма Sum
syn keyword sdblNameSupportFunction contained Среднее Avg
syn keyword sdblNameSupportFunction contained Минимум Min
syn keyword sdblNameSupportFunction contained Максимум Max
syn keyword sdblNameSupportFunction contained Количество Count

"Прочие функции
syn keyword sdblNameSupportFunction contained ЕстьNULL IsNULL
syn keyword sdblNameSupportFunction contained Представление Presentation
syn keyword sdblNameSupportFunction contained ПредставлениеСсылки RefPresentation
syn keyword sdblNameSupportFunction contained ТипЗначения ValueType

syn keyword sdblSupportType Число Number Строка String Дата Date

syn match sdblSupportFunction "\%([^.]\@1<=\|^\)\%(\<\%([a-z0-9_а-яё]\+\)*\>\)\ze\s*(" contains=sdblNameSupportFunction

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

HiLink sdblOperatorPunctuation          Operator
HiLink sdblOperator                     Operator
HiLink sdblCommentLineDoubleSlash       Comment
HiLink sdblStringQuotedDouble           String
HiLink sdblConstantLanguage             Constant
HiLink sdblConstantNumeric              Number
HiLink sdblConstantFloat                Float
HiLink sdblKeywordControlConditional    Conditional
HiLink sdblKeywordOperatorLogical       Operator
HiLink sdblKeywordControl               Statement
HiLink sdblNameSupportFunction          Function
HiLink sdblSupportType                  Type
HiLink sdblVariableParameter            Identifier

delcommand HiLink
endif

let b:current_syntax = "sdbl"



