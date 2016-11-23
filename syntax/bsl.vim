" Vim syntax file
" Language:	1C (BSL)
" Maintainer:	Alexander Andreev <andreevlex.as@gmail.com>
" Last Change:	23/11/2016
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'bsl'
endif

let s:cpo_save = &cpo
set cpo&vim

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("bsl_fold")
  unlet bsl_fold
endif

syn case ignore
syn sync lines=250

syn match  keyword_operator_punctuation_bsl display  "[\[\]:(),;]"
syn match  keyword_operator_bsl             display  "[-+/*%=<>.?]"

"Поддержка 1c-query
syntax include @bslSDBL <sfile>:p:h/sdbl.vim
unlet b:current_syntax

syn region comment_line_double_slash_bsl  start="//" end="$" contains=bslTODO
syn region string_quoted_double_bsl       matchgroup=bslStrings start=+"+ end=+"+ contains=source_sdbl
syn region source_sdbl   start="\(Выбрать\|Select\(\s\+Разрешенные\|\s\+Allowed\)\?\(\s\+Различные\|\s\+Distinct\)\?\(\s\+Первые\|\s\+Top\)\?\)" end="\(\(\"[^\"]\)\@=\)" contains=@bslSDBL transparent
syn match  constant_numeric_bsl             display "-\=\<\d\+\>"
syn match  constant_float_bsl               display "-\=\<\d\+\.\d\+\>"
syn match  constant_other_date_bsl           "\'\(\(\d{4}[^\d\']*\d{2}[^\d\']*\d{2}\)\([^\d\']*\d{2}[^\d\']*\d{2}\([^\d\']*\d{2}\)\?\)\?\)\'"

syn keyword bslTODO                  contained TODO FIXME 

" --- Keywords ---
syn keyword constant_language_bsl    Неопределено Undefined Истина True Ложь False NULL 
syn keyword keyword_control_bsl      Прервать Break Продолжить Continue Возврат Return 
syn keyword keyword_control_conditional_bsl Если If Иначе Else ИначеЕсли ElsIf Тогда Then КонецЕсли EndIf 
syn keyword keyword_control_exception_bsl   Попытка Try Исключение Except КонецПопытки EndTry ВызватьИсключение Raise 
syn keyword keyword_control_repeat_bsl      Пока While Для For Каждого Each Из In По To Цикл Do КонецЦикла EndDo 
syn keyword keyword_operator_logical_bsl    НЕ NOT И AND ИЛИ OR 
syn keyword storage_modifier_bsl    Экспорт Export 
syn keyword storage_modifier_bsl    Знач Val 
syn keyword storage_modifier_bsl    Перем Var 

" directive
syn match  keyword_other_directive_bsl "&\(НаКлиенте\(\(НаСервере\(БезКонтекста\)\?\)\?\)\|AtClient\(\(AtServer\(NoContext\)\?\)\?\)\|НаСервере\(БезКонтекста\)\?\|AtServer\(NoContext\)\?\)" 
syn region keyword_control_import_bsl start="#\(Использовать\|Use\)" end="$"
" preprocessor conditional
syn match  keyword_other_preprocessor_bsl "#\(Если\|If\|ИначеЕсли\|ElsIf\|Иначе\|Else\|КонецЕсли\|EndIf\).*\(Тогда\|Then\)\?"
" region
syn region keyword_other_section_bsl start="#\(Область\|Region\)" end="$"
syn match  keyword_other_section_bsl "#\(КонецОбласти\|EndRegion\)"
"Annotations
syn region keyword_other_annotation start="&\(Перед\|Before\|После\|After\|Вместо\|Around\)" end="$" 
"Functions w/o brackets
syn keyword support_function_bsl Новый New
" Глобальный контекст - функции работы со значениями типа Строка
syn keyword support_function_bsl contained СтрДлина StrLen 
syn keyword support_function_bsl contained СокрЛ TrimL 
syn keyword support_function_bsl contained СокрП TrimR 
syn keyword support_function_bsl contained СокрЛП TrimAll 
syn keyword support_function_bsl contained Лев Left 
syn keyword support_function_bsl contained Прав Right 
syn keyword support_function_bsl contained Сред Mid 
syn keyword support_function_bsl contained СтрНайти StrFind 
syn keyword support_function_bsl contained ВРег Upper 
syn keyword support_function_bsl contained НРег Lower 
syn keyword support_function_bsl contained ТРег Title 
syn keyword support_function_bsl contained Символ Char 
syn keyword support_function_bsl contained КодСимвола CharCode 
syn keyword support_function_bsl contained ПустаяСтрока IsBlankString 
syn keyword support_function_bsl contained СтрЗаменить StrReplace 
syn keyword support_function_bsl contained СтрЧислоСтрок StrLineCount 
syn keyword support_function_bsl contained СтрПолучитьСтроку StrGetLine 
syn keyword support_function_bsl contained СтрЧислоВхождений StrOccurrenceCount 
syn keyword support_function_bsl contained СтрСравнить StrCompare 
syn keyword support_function_bsl contained СтрНачинаетсяС StrStartWith 
syn keyword support_function_bsl contained СтрЗаканчиваетсяНа StrEndsWith 
syn keyword support_function_bsl contained СтрРазделить StrSplit 
syn keyword support_function_bsl contained СтрСоединить StrConcat 

" Глобальный контекст - функции работы со значениями типа Число
syn keyword support_function_bsl contained Цел Int Окр Round ACos ASin ATan Cos Exp Log Log10 Pow Sin Sqrt Tan 

" Глобальный контекст - функции работы со значениями типа Дата
syn keyword support_function_bsl contained Год Year 
syn keyword support_function_bsl contained Месяц Month 
syn keyword support_function_bsl contained День Day 
syn keyword support_function_bsl contained Час Hour 
syn keyword support_function_bsl contained Минута Minute 
syn keyword support_function_bsl contained Секунда Second 
syn keyword support_function_bsl contained НачалоГода BegOfYear 
syn keyword support_function_bsl contained НачалоДня BegOfDay 
syn keyword support_function_bsl contained НачалоКвартала BegOfQuarter 
syn keyword support_function_bsl contained НачалоМесяца BegOfMonth 
syn keyword support_function_bsl contained НачалоМинуты BegOfMinute 
syn keyword support_function_bsl contained НачалоНедели BegOfWeek 
syn keyword support_function_bsl contained НачалоЧаса BegOfHour 
syn keyword support_function_bsl contained КонецГода EndOfYear 
syn keyword support_function_bsl contained КонецДня EndOfDay 
syn keyword support_function_bsl contained КонецКвартала EndOfQuarter 
syn keyword support_function_bsl contained КонецМесяца EndOfMonth 
syn keyword support_function_bsl contained КонецМинуты EndOfMinute 
syn keyword support_function_bsl contained КонецНедели EndOfWeek 
syn keyword support_function_bsl contained КонецЧаса EndOfHour 
syn keyword support_function_bsl contained НеделяГода WeekOfYear 
syn keyword support_function_bsl contained ДеньГода DayOfYear 
syn keyword support_function_bsl contained ДеньНедели WeekDay 
syn keyword support_function_bsl contained ТекущаяДата CurrentDate 
syn keyword support_function_bsl contained ДобавитьМесяц AddMonth 
	 
" Глобальный контекст - функции работы со значениями типа Тип
syn keyword support_function_bsl contained Тип Type
syn keyword support_function_bsl contained ТипЗнч TypeOf 

" Глобальный контекст - функции преобразования значений
syn keyword support_function_bsl contained Булево Boolean 
syn keyword support_function_bsl contained Число Number 
syn keyword support_function_bsl contained Строка String 
syn keyword support_function_bsl contained Дата Date 

" Глобальный контекст - процедуры и функции интерактивной работы
syn keyword support_function_bsl contained ПоказатьВопрос ShowQueryBox 
syn keyword support_function_bsl contained Вопрос DoQueryBox 
syn keyword support_function_bsl contained ПоказатьПредупреждение ShowMessageBox 
syn keyword support_function_bsl contained Предупреждение DoMessageBox 
syn keyword support_function_bsl contained Сообщить Message 
syn keyword support_function_bsl contained ОчиститьСообщения ClearMessages 
syn keyword support_function_bsl contained ОповеститьОбИзменении NotifyChanged 
syn keyword support_function_bsl contained Состояние Status 
syn keyword support_function_bsl contained Сигнал Beep 
syn keyword support_function_bsl contained ПоказатьЗначение ShowValue 
syn keyword support_function_bsl contained ОткрытьЗначение OpenValue 
syn keyword support_function_bsl contained Оповестить Notify 
syn keyword support_function_bsl contained ОбработкаПрерыванияПользователя UserInterruptProcessing 
syn keyword support_function_bsl contained ОткрытьСодержаниеСправки OpenHelpContent 
syn keyword support_function_bsl contained ОткрытьИндексСправки OpenHelpIndex 
syn keyword support_function_bsl contained ОткрытьСправку OpenHelp 
syn keyword support_function_bsl contained ПоказатьИнформациюОбОшибке ShowErrorInfo 
syn keyword support_function_bsl contained КраткоеПредставлениеОшибки BriefErrorDescription 
syn keyword support_function_bsl contained ПодробноеПредставлениеОшибки DetailErrorDescription 
syn keyword support_function_bsl contained ПолучитьФорму GetForm 
syn keyword support_function_bsl contained ЗакрытьСправку CloseHelp 
syn keyword support_function_bsl contained ПоказатьОповещениеПользователя ShowUserNotification 
syn keyword support_function_bsl contained ОткрытьФорму OpenForm 
syn keyword support_function_bsl contained ОткрытьФормуМодально OpenFormModal 
syn keyword support_function_bsl contained АктивноеОкно ActiveWindow 
syn keyword support_function_bsl contained ВыполнитьОбработкуОповещения ExecuteNotifyProcessing 

 " Глобальный контекст - функции для вызова диалога ввода данных
syn keyword support_function_bsl contained ПоказатьВводЗначения ShowInputValue 
syn keyword support_function_bsl contained ВвестиЗначение InputValue 
syn keyword support_function_bsl contained ПоказатьВводЧисла ShowInputNumber 
syn keyword support_function_bsl contained ВвестиЧисло InputNumber 
syn keyword support_function_bsl contained ПоказатьВводСтроки ShowInputString 
syn keyword support_function_bsl contained ВвестиСтроку InputString 
syn keyword support_function_bsl contained ПоказатьВводДаты ShowInputDate 
syn keyword support_function_bsl contained ВвестиДату InputDate 
	 
" Глобальный контекст - функции форматирования
syn keyword support_function_bsl contained Формат Format 
syn keyword support_function_bsl contained ЧислоПрописью NumberInWords 
syn keyword support_function_bsl contained НСтр NStr 
syn keyword support_function_bsl contained ПредставлениеПериода PeriodPresentation 
syn keyword support_function_bsl contained СтрШаблон StrTemplate 
	 
"Глобальный контекст - функции обращения к конфигурации
syn keyword support_function_bsl contained ПолучитьОбщийМакет GetCommonTemplate 
syn keyword support_function_bsl contained ПолучитьОбщуюФорму GetCommonForm 
syn keyword support_function_bsl contained ПредопределенноеЗначение PredefinedValue 
syn keyword support_function_bsl contained ПолучитьПолноеИмяПредопределенногоЗначения GetPredefinedValueFullName 

 "Глобальный контекст - процедуры и функции сеанса работы
syn keyword support_function_bsl contained ПолучитьЗаголовокСистемы GetCaption 
syn keyword support_function_bsl contained ПолучитьСкоростьКлиентскогоСоединения GetClientConnectionSpeed 
syn keyword support_function_bsl contained ПодключитьОбработчикОжидания AttachIdleHandler 
syn keyword support_function_bsl contained УстановитьЗаголовокСистемы SetCaption 
syn keyword support_function_bsl contained ОтключитьОбработчикОжидания DetachIdleHandler 
syn keyword support_function_bsl contained ИмяКомпьютера ComputerName 
syn keyword support_function_bsl contained ЗавершитьРаботуСистемы Exit 
syn keyword support_function_bsl contained ИмяПользователя UserName 
syn keyword support_function_bsl contained ПрекратитьРаботуСистемы Terminate 
syn keyword support_function_bsl contained ПолноеИмяПользователя UserFullName 
syn keyword support_function_bsl contained ЗаблокироватьРаботуПользователя LockApplication 
syn keyword support_function_bsl contained КаталогПрограммы BinDir 
syn keyword support_function_bsl contained КаталогВременныхФайлов TempFilesDir 
syn keyword support_function_bsl contained ПравоДоступа AccessRight 
syn keyword support_function_bsl contained РольДоступна IsInRole 
syn keyword support_function_bsl contained ТекущийЯзык CurrentLanguage 
syn keyword support_function_bsl contained ТекущийКодЛокализации CurrentLocaleCode 
syn keyword support_function_bsl contained СтрокаСоединенияИнформационнойБазы InfoBaseConnectionString 
syn keyword support_function_bsl contained ПодключитьОбработчикОповещения AttachNotificationHandler 
syn keyword support_function_bsl contained ОтключитьОбработчикОповещения DetachNotificationHandler 
syn keyword support_function_bsl contained ПолучитьСообщенияПользователю GetUserMessages 
syn keyword support_function_bsl contained ПараметрыДоступа AccessParameters 
syn keyword support_function_bsl contained ПредставлениеПриложения ApplicationPresentation 
syn keyword support_function_bsl contained ТекущийЯзыкСистемы CurrentSystemLanguage 
syn keyword support_function_bsl contained ЗапуститьСистему RunSystem 
syn keyword support_function_bsl contained ТекущийРежимЗапуска CurrentRunMode 
syn keyword support_function_bsl contained УстановитьЧасовойПоясСеанса SetSessionTimeZone 
syn keyword support_function_bsl contained ЧасовойПоясСеанса SessionTimeZone 
syn keyword support_function_bsl contained ТекущаяДатаСеанса CurrentSessionDate 
syn keyword support_function_bsl contained УстановитьКраткийЗаголовокПриложения SetShortApplicationCaption 
syn keyword support_function_bsl contained ПолучитьКраткийЗаголовокПриложения GetShortApplicationCaption 
syn keyword support_function_bsl contained ПредставлениеПрава RightPresentation 
syn keyword support_function_bsl contained ВыполнитьПроверкуПравДоступа VerifyAccessRights 
syn keyword support_function_bsl contained РабочийКаталогДанныхПользователя UserDataWorkDir 
syn keyword support_function_bsl contained КаталогДокументов DocumentsDir 
syn keyword support_function_bsl contained ПолучитьИнформациюЭкрановКлиента GetClientDisplaysInformation 
syn keyword support_function_bsl contained ТекущийВариантОсновногоШрифтаКлиентскогоПриложения ClientApplicationBaseFontCurrentVariant 
syn keyword support_function_bsl contained ТекущийВариантИнтерфейсаКлиентскогоПриложения ClientApplicationInterfaceCurrentVariant 
syn keyword support_function_bsl contained УстановитьЗаголовокКлиентскогоПриложения SetClientApplicationCaption 
syn keyword support_function_bsl contained ПолучитьЗаголовокКлиентскогоПриложения GetClientApplicationCaption 
syn keyword support_function_bsl contained НачатьПолучениеКаталогаВременныхФайлов BeginGettingTempFilesDir 
syn keyword support_function_bsl contained НачатьПолучениеКаталогаДокументов BeginGettingDocumentsDir 
syn keyword support_function_bsl contained НачатьПолучениеРабочегоКаталогаДанныхПользователя BeginGettingUserDataWorkDir 
syn keyword support_function_bsl contained ПодключитьОбработчикЗапросаНастроекКлиентаЛицензирования AttachLicensingClientParametersRequestHandler 
syn keyword support_function_bsl contained ОтключитьОбработчикЗапросаНастроекКлиентаЛицензирования DetachLicensingClientParametersRequestHandler 
syn keyword support_function_bsl contained КаталогБиблиотекиМобильногоУстройства MobileDeviceLibraryDir 

"Глобальный контекст - процедуры и функции сохранения значений
syn keyword support_function_bsl contained ЗначениеВСтрокуВнутр ValueToStringInternal 
syn keyword support_function_bsl contained ЗначениеИзСтрокиВнутр ValueFromStringInternal 
syn keyword support_function_bsl contained ЗначениеВФайл ValueToFile 
syn keyword support_function_bsl contained ЗначениеИзФайла ValueFromFile 

 "Глобальный контекст - Процедуры и функции работы с операционной системой
syn keyword support_function_bsl contained КомандаСистемы System 
syn keyword support_function_bsl contained ЗапуститьПриложение RunApp 
syn keyword support_function_bsl contained ПолучитьCOMОбъект GetCOMObject 
syn keyword support_function_bsl contained ПользователиОС OSUsers 
syn keyword support_function_bsl contained НачатьЗапускПриложения BeginRunningApplication 

 "Глобальный контекст - Процедуры и функции работы с внешними компонентами
syn keyword support_function_bsl contained ПодключитьВнешнююКомпоненту AttachAddIn 
syn keyword support_function_bsl contained НачатьУстановкуВнешнейКомпоненты BeginInstallAddIn 
syn keyword support_function_bsl contained УстановитьВнешнююКомпоненту InstallAddIn 
syn keyword support_function_bsl contained НачатьПодключениеВнешнейКомпоненты BeginAttachingAddIn 

 "Глобальный контекст - Процедуры и функции работы с файлами
syn keyword support_function_bsl contained КопироватьФайл FileCopy 
syn keyword support_function_bsl contained ПереместитьФайл MoveFile 
syn keyword support_function_bsl contained УдалитьФайлы DeleteFiles 
syn keyword support_function_bsl contained НайтиФайлы FindFiles 
syn keyword support_function_bsl contained СоздатьКаталог CreateDirectory 
syn keyword support_function_bsl contained ПолучитьИмяВременногоФайла GetTempFileName 
syn keyword support_function_bsl contained РазделитьФайл SplitFile 
syn keyword support_function_bsl contained ОбъединитьФайлы MergeFiles 
syn keyword support_function_bsl contained ПолучитьФайл GetFile 
syn keyword support_function_bsl contained НачатьПомещениеФайла BeginPutFile 
syn keyword support_function_bsl contained ПоместитьФайл PutFile 
syn keyword support_function_bsl contained ЭтоАдресВременногоХранилища IsTempStorageURL 
syn keyword support_function_bsl contained УдалитьИзВременногоХранилища DeleteFromTempStorage 
syn keyword support_function_bsl contained ПолучитьИзВременногоХранилища GetFromTempStorage 
syn keyword support_function_bsl contained ПоместитьВоВременноеХранилище PutToTempStorage 
syn keyword support_function_bsl contained ПодключитьРасширениеРаботыСФайлами AttachFileSystemExtension 
syn keyword support_function_bsl contained НачатьУстановкуРасширенияРаботыСФайлами BeginInstallFileSystemExtension 
syn keyword support_function_bsl contained УстановитьРасширениеРаботыСФайлами InstallFileSystemExtension 
syn keyword support_function_bsl contained ПолучитьФайлы GetFiles 
syn keyword support_function_bsl contained ПоместитьФайлы PutFiles 
syn keyword support_function_bsl contained ЗапроситьРазрешениеПользователя RequestUserPermission 
syn keyword support_function_bsl contained ПолучитьМаскуВсеФайлы GetAllFilesMask 
syn keyword support_function_bsl contained ПолучитьМаскуВсеФайлыКлиента GetClientAllFilesMask 
syn keyword support_function_bsl contained ПолучитьМаскуВсеФайлыСервера GetServerAllFilesMask 
syn keyword support_function_bsl contained ПолучитьРазделительПути GetPathSeparator 
syn keyword support_function_bsl contained ПолучитьРазделительПутиКлиента GetClientPathSeparator 
syn keyword support_function_bsl contained ПолучитьРазделительПутиСервера GetServerPathSeparator 
syn keyword support_function_bsl contained НачатьПодключениеРасширенияРаботыСФайлами BeginAttachingFileSystemExtension 
syn keyword support_function_bsl contained НачатьЗапросРазрешенияПользователя BeginRequestingUserPermission 
syn keyword support_function_bsl contained НачатьПоискФайлов BeginFindingFiles 
syn keyword support_function_bsl contained НачатьСозданиеКаталога BeginCreatingDirectory 
syn keyword support_function_bsl contained НачатьКопированиеФайла BeginCopyingFile 
syn keyword support_function_bsl contained НачатьПеремещениеФайла BeginMovingFile 
syn keyword support_function_bsl contained НачатьУдалениеФайлов BeginDeletingFiles 
syn keyword support_function_bsl contained НачатьПолучениеФайлов BeginGettingFiles 
syn keyword support_function_bsl contained НачатьПомещениеФайлов BeginPuttingFiles 
syn keyword support_function_bsl contained НачатьСозданиеДвоичныхДанныхИзФайла BeginCreateBinaryDataFromFile 

 "Глобальный контекст - Процедуры и функции работы с информационной базой
syn keyword support_function_bsl contained НачатьТранзакцию BeginTransaction 
syn keyword support_function_bsl contained ЗафиксироватьТранзакцию CommitTransaction 
syn keyword support_function_bsl contained ОтменитьТранзакцию RollbackTransaction 
syn keyword support_function_bsl contained УстановитьМонопольныйРежим SetExclusiveMode 
syn keyword support_function_bsl contained МонопольныйРежим ExclusiveMode 
syn keyword support_function_bsl contained ПолучитьОперативнуюОтметкуВремени GetRealTimeTimestamp 
syn keyword support_function_bsl contained ПолучитьСоединенияИнформационнойБазы GetInfoBaseConnections 
syn keyword support_function_bsl contained НомерСоединенияИнформационнойБазы InfoBaseConnectionNumber 
syn keyword support_function_bsl contained КонфигурацияИзменена ConfigurationChanged 
syn keyword support_function_bsl contained КонфигурацияБазыДанныхИзмененаДинамически DataBaseConfigurationChangedDynamically 
syn keyword support_function_bsl contained УстановитьВремяОжиданияБлокировкиДанных SetLockWaitTime 
syn keyword support_function_bsl contained ОбновитьНумерациюОбъектов RefreshObjectsNumbering 
syn keyword support_function_bsl contained ПолучитьВремяОжиданияБлокировкиДанных GetLockWaitTime 
syn keyword support_function_bsl contained КодЛокализацииИнформационнойБазы InfoBaseLocaleCode 
syn keyword support_function_bsl contained УстановитьМинимальнуюДлинуПаролейПользователей SetUserPasswordMinLength 
syn keyword support_function_bsl contained ПолучитьМинимальнуюДлинуПаролейПользователей GetUserPasswordMinLength 
syn keyword support_function_bsl contained ИнициализироватьПредопределенныеДанные InitializePredefinedData 
syn keyword support_function_bsl contained УдалитьДанныеИнформационнойБазы EraseInfoBaseData 
syn keyword support_function_bsl contained УстановитьПроверкуСложностиПаролейПользователей SetUserPasswordStrengthCheck 
syn keyword support_function_bsl contained ПолучитьПроверкуСложностиПаролейПользователей GetUserPasswordStrengthCheck 
syn keyword support_function_bsl contained ПолучитьСтруктуруХраненияБазыДанных GetDBStorageStructureInfo 
syn keyword support_function_bsl contained УстановитьПривилегированныйРежим SetPrivilegedMode 
syn keyword support_function_bsl contained ПривилегированныйРежим PrivilegedMode 
syn keyword support_function_bsl contained ТранзакцияАктивна TransactionActive 
syn keyword support_function_bsl contained НеобходимостьЗавершенияСоединения ConnectionStopRequest 
syn keyword support_function_bsl contained НомерСеансаИнформационнойБазы InfoBaseSessionNumber 
syn keyword support_function_bsl contained ПолучитьСеансыИнформационнойБазы GetInfoBaseSessions 
syn keyword support_function_bsl contained ЗаблокироватьДанныеДляРедактирования LockDataForEdit 
syn keyword support_function_bsl contained УстановитьСоединениеСВнешнимИсточникомДанных ConnectExternalDataSource 
syn keyword support_function_bsl contained РазблокироватьДанныеДляРедактирования UnlockDataForEdit 
syn keyword support_function_bsl contained РазорватьСоединениеСВнешнимИсточникомДанных DisconnectExternalDataSource 
syn keyword support_function_bsl contained ПолучитьБлокировкуСеансов GetSessionsLock 
syn keyword support_function_bsl contained УстановитьБлокировкуСеансов SetSessionsLock 
syn keyword support_function_bsl contained ОбновитьПовторноИспользуемыеЗначения RefreshReusableValues 
syn keyword support_function_bsl contained УстановитьБезопасныйРежим SetSafeMode 
syn keyword support_function_bsl contained БезопасныйРежим SafeMode 
syn keyword support_function_bsl contained ПолучитьДанныеВыбора GetChoiceData 
syn keyword support_function_bsl contained УстановитьЧасовойПоясИнформационнойБазы SetInfoBaseTimeZone 
syn keyword support_function_bsl contained ПолучитьЧасовойПоясИнформационнойБазы GetInfoBaseTimeZone 
syn keyword support_function_bsl contained ПолучитьОбновлениеКонфигурацииБазыДанных GetDataBaseConfigurationUpdate 
syn keyword support_function_bsl contained УстановитьБезопасныйРежимРазделенияДанных SetDataSeparationSafeMode 
syn keyword support_function_bsl contained БезопасныйРежимРазделенияДанных DataSeparationSafeMode 
syn keyword support_function_bsl contained УстановитьВремяЗасыпанияПассивногоСеанса SetPassiveSessionHibernateTime 
syn keyword support_function_bsl contained ПолучитьВремяЗасыпанияПассивногоСеанса GetPassiveSessionHibernateTime 
syn keyword support_function_bsl contained УстановитьВремяЗавершенияСпящегоСеанса SetHibernateSessionTerminateTime 
syn keyword support_function_bsl contained ПолучитьВремяЗавершенияСпящегоСеанса GetHibernateSessionTerminateTime 
syn keyword support_function_bsl contained ПолучитьТекущийСеансИнформационнойБазы GetCurrentInfoBaseSession 
syn keyword support_function_bsl contained ПолучитьИдентификаторКонфигурации GetConfigurationID 
syn keyword support_function_bsl contained УстановитьНастройкиКлиентаЛицензирования SetLicensingClientParameters 
syn keyword support_function_bsl contained ПолучитьИмяКлиентаЛицензирования GetLicensingClientName 
syn keyword support_function_bsl contained ПолучитьДополнительныйПараметрКлиентаЛицензирования GetLicensingClientAdditionalParameter 
syn keyword support_function_bsl contained ПолучитьОтключениеБезопасногоРежима GetSafeModeDisabled 
syn keyword support_function_bsl contained УстановитьОтключениеБезопасногоРежима SetSafeModeDisabled 

 "Глобальный контекст - Процедуры и функции работы с данными информационной базы
syn keyword support_function_bsl contained НайтиПомеченныеНаУдаление FindMarkedForDeletion 
syn keyword support_function_bsl contained НайтиПоСсылкам FindByRef 
syn keyword support_function_bsl contained УдалитьОбъекты DeleteObjects 
syn keyword support_function_bsl contained УстановитьОбновлениеПредопределенныхДанныхИнформационнойБазы SetInfoBasePredefinedDataUpdate 
syn keyword support_function_bsl contained ПолучитьОбновлениеПредопределенныхДанныхИнформационнойБазы GetInfoBasePredefinedData 

 "Глобальный контекст - Процедуры и функции работы с XML
syn keyword support_function_bsl contained XMLСтрока XMLString 
syn keyword support_function_bsl contained XMLЗначение XMLValue 
syn keyword support_function_bsl contained XMLТип XMLType 
syn keyword support_function_bsl contained XMLТипЗнч XMLTypeOf 
syn keyword support_function_bsl contained ИзXMLТипа FromXMLType 
syn keyword support_function_bsl contained ВозможностьЧтенияXML CanReadXML 
syn keyword support_function_bsl contained ПолучитьXMLТип GetXMLType 
syn keyword support_function_bsl contained ПрочитатьXML ReadXML 
syn keyword support_function_bsl contained ЗаписатьXML WriteXML 
syn keyword support_function_bsl contained НайтиНедопустимыеСимволыXML FindDisallowedXMLCharacters 
syn keyword support_function_bsl contained ИмпортМоделиXDTO ImportXDTOModel 
syn keyword support_function_bsl contained СоздатьФабрикуXDTO CreateXDTOFactory 

 "Глобальный контекст - Процедуры и функции работы с JSON
syn keyword support_function_bsl contained ЗаписатьJSON WriteJSON 
syn keyword support_function_bsl contained ПрочитатьJSON ReadJSON 
syn keyword support_function_bsl contained ПрочитатьДатуJSON ReadJSONDate 
syn keyword support_function_bsl contained ЗаписатьДатуJSON WriteJSONDate 

 "Глобальный контекст - Процедуры и функции работы с журналом регистрации
syn keyword support_function_bsl contained ЗаписьЖурналаРегистрации WriteLogEvent 
syn keyword support_function_bsl contained ПолучитьИспользованиеЖурналаРегистрации GetEventLogUsing 
syn keyword support_function_bsl contained УстановитьИспользованиеЖурналаРегистрации SetEventLogUsing 
syn keyword support_function_bsl contained ПредставлениеСобытияЖурналаРегистрации EventLogEventPresentation 
syn keyword support_function_bsl contained ВыгрузитьЖурналРегистрации UnloadEventLog 
syn keyword support_function_bsl contained ПолучитьЗначенияОтбораЖурналаРегистрации GetEventLogFilterValues 
syn keyword support_function_bsl contained УстановитьИспользованиеСобытияЖурналаРегистрации SetEventLogEventUse 
syn keyword support_function_bsl contained ПолучитьИспользованиеСобытияЖурналаРегистрации GetEventLogEventUse 
syn keyword support_function_bsl contained СкопироватьЖурналРегистрации CopyEventLog 
syn keyword support_function_bsl contained ОчиститьЖурналРегистрации ClearEventLog 

 "Глобальный контекст - Процедуры и функции работы с универсальными объектами
syn keyword support_function_bsl contained ЗначениеВДанныеФормы ValueToFormData 
syn keyword support_function_bsl contained ДанныеФормыВЗначение FormDataToValue 
syn keyword support_function_bsl contained КопироватьДанныеФормы CopyFormData 
syn keyword support_function_bsl contained УстановитьСоответствиеОбъектаИФормы SetObjectAndFormConformity 
syn keyword support_function_bsl contained ПолучитьСоответствиеОбъектаИФормы GetObjectAndFormConformity 

 "Глобальный контекст - Процедуры и функции работы с функциональными опциями
syn keyword support_function_bsl contained ПолучитьФункциональнуюОпцию GetFunctionalOption 
syn keyword support_function_bsl contained ПолучитьФункциональнуюОпциюИнтерфейса GetInterfaceFunctionalOption 
syn keyword support_function_bsl contained УстановитьПараметрыФункциональныхОпцийИнтерфейса SetInterfaceFunctionalOptionParameters 
syn keyword support_function_bsl contained ПолучитьПараметрыФункциональныхОпцийИнтерфейса GetInterfaceFunctionalOptionParameters 
syn keyword support_function_bsl contained ОбновитьИнтерфейс RefreshInterface 

 "Глобальный контекст - Процедуры и функции работы с криптографией
syn keyword support_function_bsl contained УстановитьРасширениеРаботыСКриптографией InstallCryptoExtension 
syn keyword support_function_bsl contained НачатьУстановкуРасширенияРаботыСКриптографией BeginInstallCryptoExtension 
syn keyword support_function_bsl contained ПодключитьРасширениеРаботыСКриптографией AttachCryptoExtension 
syn keyword support_function_bsl contained НачатьПодключениеРасширенияРаботыСКриптографией BeginAttachingCryptoExtension 

 "Глобальный контекст - Процедуры и функции работы со стандартным интерфейсом OData
syn keyword support_function_bsl contained УстановитьСоставСтандартногоИнтерфейсаOData SetStandardODataInterfaceContent 
syn keyword support_function_bsl contained ПолучитьСоставСтандартногоИнтерфейсаOData GetStandardODataInterfaceContent 

" Глобальный контекст - Процедуры и функции работы с двоичными данными"
syn keyword support_function_bsl contained СоединитьБуферыДвоичныхДанных ConcatBinaryDataBuffers 

 "Глобальный контекст - Прочие процедуры и функции
syn keyword support_function_bsl contained Мин Min 
syn keyword support_function_bsl contained Макс Max 
syn keyword support_function_bsl contained ОписаниеОшибки ErrorDescription 
syn keyword support_function_bsl contained Вычислить Eval 
syn keyword support_function_bsl contained ИнформацияОбОшибке ErrorInfo 
syn keyword support_function_bsl contained Base64Значение Base64Value 
syn keyword support_function_bsl contained Base64Строка Base64String 
syn keyword support_function_bsl contained ЗаполнитьЗначенияСвойств FillPropertyValues 
syn keyword support_function_bsl contained ЗначениеЗаполнено ValueIsFilled 
syn keyword support_function_bsl contained ПолучитьПредставленияНавигационныхСсылок GetURLsPresentations 
syn keyword support_function_bsl contained НайтиОкноПоНавигационнойСсылке FindWindowByURL 
syn keyword support_function_bsl contained ПолучитьОкна GetWindows 
syn keyword support_function_bsl contained ПерейтиПоНавигационнойСсылке GotoURL 
syn keyword support_function_bsl contained ПолучитьНавигационнуюСсылку GetURL 
syn keyword support_function_bsl contained ПолучитьДопустимыеКодыЛокализации GetAvailableLocaleCodes 
syn keyword support_function_bsl contained ПолучитьНавигационнуюСсылкуИнформационнойБазы GetInfoBaseURL 
syn keyword support_function_bsl contained ПредставлениеКодаЛокализации LocaleCodePresentation 
syn keyword support_function_bsl contained ПолучитьДопустимыеЧасовыеПояса GetAvailableTimeZones 
syn keyword support_function_bsl contained ПредставлениеЧасовогоПояса TimeZonePresentation 
syn keyword support_function_bsl contained ТекущаяУниверсальнаяДата CurrentUniversalDate 
syn keyword support_function_bsl contained ТекущаяУниверсальнаяДатаВМиллисекундах CurrentUniversalDateInMilliseconds 
syn keyword support_function_bsl contained МестноеВремя ToLocalTime 
syn keyword support_function_bsl contained УниверсальноеВремя ToUniversalTime 
syn keyword support_function_bsl contained ЧасовойПояс TimeZone 
syn keyword support_function_bsl contained СмещениеЛетнегоВремени DaylightTimeOffset 
syn keyword support_function_bsl contained СмещениеСтандартногоВремени StandardTimeOffset 
syn keyword support_function_bsl contained КодироватьСтроку EncodeString 
syn keyword support_function_bsl contained РаскодироватьСтроку DecodeString 
syn keyword support_function_bsl contained Найти Find 
syn keyword support_function_bsl contained ПродолжитьВызов ProceedWithCall 

 "Глобальный контекст - События приложения и сеанса
syn keyword support_function_bsl contained ПередНачаломРаботыСистемы BeforeStart 
syn keyword support_function_bsl contained ПриНачалеРаботыСистемы OnStart 
syn keyword support_function_bsl contained ПередЗавершениемРаботыСистемы BeforeExit 
syn keyword support_function_bsl contained ПриЗавершенииРаботыСистемы OnExit 
syn keyword support_function_bsl contained ОбработкаВнешнегоСобытия ExternEventProcessing 
syn keyword support_function_bsl contained УстановкаПараметровСеанса SessionParametersSetting 
syn keyword support_function_bsl contained ПриИзмененииПараметровЭкрана OnChangeDisplaySettings 

" Глобальный контекст - Свойства (классы)
syn keyword support_class_bsl WSСсылки WSReferences 
syn keyword support_class_bsl БиблиотекаКартинок PictureLib 
syn keyword support_class_bsl БиблиотекаМакетовОформленияКомпоновкиДанных DataCompositionAppearanceTemplateLib 
syn keyword support_class_bsl БиблиотекаСтилей StyleLib 
syn keyword support_class_bsl БизнесПроцессы BusinessProcesses 
syn keyword support_class_bsl ВнешниеИсточникиДанных ExternalDataSources 
syn keyword support_class_bsl ВнешниеОбработки ExternalDataProcessors 
syn keyword support_class_bsl ВнешниеОтчеты ExternalReports 
syn keyword support_class_bsl Документы Documents 
syn keyword support_class_bsl ДоставляемыеУведомления DeliverableNotifications 
syn keyword support_class_bsl ЖурналыДокументов DocumentJournals 
syn keyword support_class_bsl Задачи Tasks 
syn keyword support_class_bsl ИнформацияОбИнтернетСоединении InternetConnectionInformation 
syn keyword support_class_bsl ИспользованиеРабочейДаты WorkingDateUse 
syn keyword support_class_bsl ИсторияРаботыПользователя UserWorkHistory 
syn keyword support_class_bsl Константы Constants 
syn keyword support_class_bsl КритерииОтбора FilterCriteria 
syn keyword support_class_bsl Метаданные Metadata 
syn keyword support_class_bsl Обработки DataProcessors 
syn keyword support_class_bsl ОтправкаДоставляемыхУведомлений DeliverableNotificationSend 
syn keyword support_class_bsl Отчеты Reports 
syn keyword support_class_bsl ПараметрыСеанса SessionParameters 
syn keyword support_class_bsl Перечисления Enums 
syn keyword support_class_bsl ПланыВидовРасчета ChartsOfCalculationTypes 
syn keyword support_class_bsl ПланыВидовХарактеристик ChartsOfCharacteristicTypes 
syn keyword support_class_bsl ПланыОбмена ExchangePlans 
syn keyword support_class_bsl ПланыСчетов ChartsOfAccounts 
syn keyword support_class_bsl ПолнотекстовыйПоиск FullTextSearch 
syn keyword support_class_bsl ПользователиИнформационнойБазы InfoBaseUsers 
syn keyword support_class_bsl Последовательности Sequences 
syn keyword support_class_bsl РасширенияКонфигурации ConfigurationExtensions 
syn keyword support_class_bsl РегистрыБухгалтерии AccountingRegisters 
syn keyword support_class_bsl РегистрыНакопления AccumulationRegisters 
syn keyword support_class_bsl РегистрыРасчета CalculationRegisters 
syn keyword support_class_bsl РегистрыСведений InformationRegisters 
syn keyword support_class_bsl РегламентныеЗадания ScheduledJobs 
syn keyword support_class_bsl СериализаторXDTO XDTOSerializer 
syn keyword support_class_bsl Справочники Catalogs 
syn keyword support_class_bsl СредстваГеопозиционирования LocationTools 
syn keyword support_class_bsl СредстваКриптографии CryptoToolsManager 
syn keyword support_class_bsl СредстваМультимедиа MultimediaTools 
syn keyword support_class_bsl СредстваОтображенияРекламы AdvertisingPresentationTools 
syn keyword support_class_bsl СредстваПочты MailTools 
syn keyword support_class_bsl СредстваТелефонии TelephonyTools 
syn keyword support_class_bsl ФабрикаXDTO XDTOFactory 
syn keyword support_class_bsl ФайловыеПотоки FileStreams 
syn keyword support_class_bsl ФоновыеЗадания BackgroundJobs 
syn keyword support_class_bsl ХранилищаНастроек SettingsStorages 
syn keyword support_class_bsl ВстроенныеПокупки InAppPurchases 
syn keyword support_class_bsl ОтображениеРекламы AdRepresentation 
syn keyword support_class_bsl ПанельЗадачОС OSTaskbar 
syn keyword support_class_bsl ПроверкаВстроенныхПокупок InAppPurchasesValidation

" Глобальный контекст - Свойства (переменные)
syn keyword support_variable_bsl ГлавныйИнтерфейс MainInterface 
syn keyword support_variable_bsl ГлавныйСтиль MainStyle 
syn keyword support_variable_bsl ПараметрЗапуска LaunchParameter 
syn keyword support_variable_bsl РабочаяДата WorkingDate 
syn keyword support_variable_bsl ХранилищеВариантовОтчетов ReportsVariantsStorage 
syn keyword support_variable_bsl ХранилищеНастроекДанныхФорм FormDataSettingsStorage 
syn keyword support_variable_bsl ХранилищеОбщихНастроек CommonSettingsStorage 
syn keyword support_variable_bsl ХранилищеПользовательскихНастроекДинамическихСписков DynamicListsUserSettingsStorage 
syn keyword support_variable_bsl ХранилищеПользовательскихНастроекОтчетов ReportsUserSettingsStorage 
syn keyword support_variable_bsl ХранилищеСистемныхНастроек SystemSettingsStorage

syn match bslSupportFunction  "\%([^.]\@1<=\|^\)\%(\<\%([a-z0-9_а-яё]\+\)*\>\)\ze\s*(" contains=support_function_bsl

" Поддержка сворачивания кода
if exists("bsl_fold")
    syn match keyword_statement_bsl "\<\(Функция\|Function\)\>"
    syn match keyword_statement_bsl "\<\(КонецФункции\|EndFunction\)\>"
    syn region bslFunctionFold
	\ matchgroup=keyword_statement_bsl
	\ start="\c\<\(функция\|function\)\>"
	\ end="\c\<\(конецфункции\|endfunction\)\>"
	\ transparent fold
	\ keepend 

    syn match keyword_statement_bsl "\<\(Процедура\|Procedure\)\>"
    syn match keyword_statement_bsl "\<\(КонецПроцедуры\|EndProcedure\)\>"
    syn region bslProcedureFold
	\ matchgroup=keyword_statement_bsl
	\ start="\c\<\(процедура\|procedure\)\>"
	\ end="\c\<\(конецпроцедуры\|endprocedure\)\>"
	\ transparent fold
        \ keepend 

    syn sync match bslSync	grouphere bslFunctionFold  "\<\(Функция\|Function\)\>"
    syn sync match bslSync	grouphere bslProcedureFold "\<\(Процедура\|Procedure\)\>"

    setlocal foldmethod=syntax
else
    syn keyword keyword_statement_bsl    Процедура Procedure Функция Function
    syn keyword keyword_statement_bsl    КонецПроцедуры EndProcedure КонецФункции EndFunction 
endif

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

HiLink keyword_operator_punctuation_bsl          Operator
HiLink keyword_operator_bsl                      Operator
HiLink comment_line_double_slash_bsl		 Comment
HiLink string_quoted_double_bsl                  String
HiLink constant_numeric_bsl                      Number
HiLink constant_float_bsl                        Float
HiLink constant_other_date_bsl                   Constant
HiLink bslTODO                                   Todo
HiLink constant_language_bsl                     Constant
HiLink keyword_statement_bsl                     Statement
HiLink keyword_control_bsl                       Keyword
HiLink keyword_control_conditional_bsl           Conditional
HiLink keyword_control_exception_bsl             Exception
HiLink keyword_control_repeat_bsl                Repeat
HiLink keyword_operator_logical_bsl              Operator
HiLink storage_modifier_bsl                      Type
HiLink keyword_other_directive_bsl               Define
HiLink keyword_control_import_bsl                Include
HiLink keyword_other_preprocessor_bsl            PreCondit
HiLink keyword_other_section_bsl                 PreProc
HiLink keyword_other_annotation                  Define
HiLink support_function_bsl                      Function
HiLink support_class_bsl                         Type
HiLink support_variable_bsl                      Constant

delcommand HiLink
endif

let b:current_syntax = "bsl"

if main_syntax == 'bsl'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
