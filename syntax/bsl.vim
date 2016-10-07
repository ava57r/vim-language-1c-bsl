" Vim syntax file
" Language:	1C (BSL)
" Maintainer:	Andreev Alexander <andreevlex.as@gmail.com>
" Last Change:	01/10/2016
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

"Punctuation 
syn match bslPunctuation "\([\[\]:(),;]\)"
syn match bslOperator "[-+/*%=<>.?]"
" Comment
syn region bslComment start="//" end="$"
" String
syn region bslString matchgroup=bslStrings start=+"+ skip=+\\"+ end=+"+

" --- Constants ---
syn keyword bslConstant Неопределено Undefined Истина True Ложь False NULL

syn match  bslNumber		"-\=\<\d\+\>"
syn match  bslFloat		"-\=\<\d\+\.\d\+\>"

" constant date
syn match bslDate "\'\(\(\d{4}[^\d\']*\d{2}[^\d\']*\d{2}\)\([^\d\']*\d{2}[^\d\']*\d{2}\([^\d\']*\d{2}\)\?\)\?\)\'"

" --- Keywords ---
syn match bslImport "#\(Использовать\|Use\)"
syn keyword bslOperator НЕ NOT И AND ИЛИ OR 
syn keyword bslStatement Процедура Procedure Функция Function
syn keyword bslStatement КонецПроцедуры EndProcedure КонецФункции EndFunction
syn keyword bslStatement Прервать Break Продолжить Continue Возврат Return
syn keyword bslConditional Если If Иначе Else ИначеЕсли ElsIf Тогда Then КонецЕсли EndIf
syn keyword bslException Попытка Try Исключение Except КонецПопытки EndTry ВызватьИсключение Raise
syn keyword bslRepeat Пока While Для For Каждого Each Из In По To Цикл Do КонецЦикла EndDo
" modifier
syn keyword bslModifier Экспорт Export Знач Val Перем Var Новый New 

" directive
syn match bslDirective "&\(НаКлиенте\(\(НаСервере\(БезКонтекста\)\?\)\?\)\|AtClient\(\(AtServer\(NoContext\)\?\)\?\)\|НаСервере\(БезКонтекста\)\?\|AtServer\(NoContext\)\?\)$"
" preprocessor conditional
syn match bslPreCondit "#\(Если\|If\|ИначеЕсли\|ElsIf\|Иначе\|Else\|КонецЕсли\|EndIf\).*\(Тогда\|Then\)\?"
" region
syn match bslRegion "#\(Область\|Region\)"
syn match bslRegion "#\(КонецОбласти\|EndRegion\)"

" --- Глобальный контекст ---
" функции работы со значениями типа Строка
syn keyword bslGlobalFunction СтрДлина StrLen СокрЛ TrimL СокрП TrimR СокрЛП TrimAll Лев Left Прав Right Сред Mid СтрНайти StrFind ВРег Upper НРег Lower ТРег Title Символ Char КодСимвола CharCode ПустаяСтрока IsBlankString СтрЗаменить StrReplace СтрЧислоСтрок StrLineCount СтрПолучитьСтроку StrGetLine СтрЧислоВхождений StrOccurrenceCount СтрСравнить StrCompare СтрНачинаетсяС StrStartWith СтрЗаканчиваетсяНа StrEndsWith СтрРазделить StrSplit СтрСоединить StrConcat
" функции работы со значениями типа Число
syn keyword bslGlobalFunction Цел Int Окр Round ACos ACos ASin ASin ATan ATan Cos Cos Exp Exp Log Log Log10 Log10 Pow Pow Sin Sin Sqrt Sqrt Tan Tan
" функции работы со значениями типа Дата
syn keyword bslGlobalFunction Год Year Месяц Month День Day Час Hour Минута Minute Секунда Second НачалоГода BegOfYear НачалоДня BegOfDay НачалоКвартала BegOfQuarter НачалоМесяца BegOfMonth НачалоМинуты BegOfMinute НачалоНедели BegOfWeek НачалоЧаса BegOfHour КонецГода EndOfYear КонецДня EndOfDay КонецКвартала EndOfQuarter КонецМесяца EndOfMonth КонецМинуты EndOfMinute КонецНедели EndOfWeek КонецЧаса EndOfHour НеделяГода WeekOfYear ДеньГода DayOfYear ДеньНедели WeekDay ТекущаяДата CurrentDate ДобавитьМесяц AddMonth
" функции работы со значениями типа Тип
syn keyword bslGlobalFunction Тип Type ТипЗнч TypeOf
" функции преобразования значений
syn keyword bslGlobalFunction Булево Boolean Число Number Строка String Дата Date

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_bsl_syn_inits")
  if version < 508
    let did_bsl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

HiLink bslPunctuation           Statement
HiLink bslOperator              Operator
HiLink bslComment		Comment
HiLink bslString                String
HiLink bslConstant              Constant
HiLink bslNumber                Number
HiLink bslFloat                 Float
HiLink bslDate                  Constant
HiLink bslImport                Include
HiLink bslStatement             Statement
HiLink bslConditional           Conditional
HiLink bslExeption              Exception
HiLink bslRepeat                Repeat
HiLink bslModifier              Type
HiLink bslDirective             Define
HiLink bslPreCondit             PreCondit
HiLink bslRegion                PreProc
HiLink bslGlobalFunction        Function

delcommand HiLink
endif

let b:current_syntax = "bsl"
