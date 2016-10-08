" Vim syntax file
" Language:	1C (BSL)
" Maintainer:	Andreev Alexander <andreevlex.as@gmail.com>
" Last Change:	08/10/2016
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

syn match  keyword_operator_punctuation_bsl  "\([\[\]:(),;]\)"
syn match  keyword_operator_bsl              "[-+/*%=<>.?]"
syn region comment_line_double_slash_bsl  start="//" end="$"
syn region string_quoted_double_bsl       matchgroup=bslStrings start=+"+ skip=+\\"+ end=+"+
syn match  constant_numeric_bsl              "-\=\<\d\+\>"
syn match  constant_float_bsl                "-\=\<\d\+\.\d\+\>"
syn match  constant_other_date_bsl           "\'\(\(\d{4}[^\d\']*\d{2}[^\d\']*\d{2}\)\([^\d\']*\d{2}[^\d\']*\d{2}\([^\d\']*\d{2}\)\?\)\?\)\'"

" --- Keywords ---
syn keyword constant_language_bsl    Неопределено Undefined Истина True Ложь False NULL 
syn keyword keyword_statement_bsl    Процедура Procedure Функция Function
syn keyword keyword_statement_bsl    КонецПроцедуры EndProcedure КонецФункции EndFunction 
syn keyword keyword_control_bsl      Прервать Break Продолжить Continue Возврат Return 
syn keyword keyword_control_conditional_bsl Если If Иначе Else ИначеЕсли ElsIf Тогда Then КонецЕсли EndIf 
syn keyword keyword_control_exception_bsl   Попытка Try Исключение Except КонецПопытки EndTry ВызватьИсключение Raise 
syn keyword keyword_control_repeat_bsl      Пока While Для For Каждого Each Из In По To Цикл Do КонецЦикла EndDo 
syn keyword keyword_operator_logical_bsl    НЕ NOT И AND ИЛИ OR 
syn keyword storage_modifier_bsl    Экспорт Export 
syn keyword storage_modifier_bsl    Знач Val 
syn keyword storage_modifier_bsl    Перем Var 

" directive
syn match keyword_other_directive_bsl "&\(НаКлиенте\(\(НаСервере\(БезКонтекста\)\?\)\?\)\|AtClient\(\(AtServer\(NoContext\)\?\)\?\)\|НаСервере\(БезКонтекста\)\?\|AtServer\(NoContext\)\?\)" 
syn region keyword_control_import_bsl start="#\(Использовать\|Use\)" end="$"
" preprocessor conditional
syn match keyword_other_preprocessor_bsl "#\(Если\|If\|ИначеЕсли\|ElsIf\|Иначе\|Else\|КонецЕсли\|EndIf\).*\(Тогда\|Then\)\?"
" region
syn region keyword_other_section_bsl start="#\(Область\|Region\)" end="$"
syn match keyword_other_section_bsl "#\(КонецОбласти\|EndRegion\)"
"Annotations
syn region keyword_other_annotation start="&\(Перед\|Before\|После\|After\|Вместо\|Around\)" end="$" 
"Functions w/o brackets
syn match support_function_bsl    "\(\(\W[^а-яё.]\)\@<=\|^\)\(Новый\|New\)\(\(\W[^а-яё.]\)\@=\|$\)"
" Глобальный контекст - функции работы со значениями типа Строка
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(СтрДлина\|StrLen\|СокрЛ\|TrimL\|СокрП\|TrimR\|СокрЛП\|TrimAll\|Лев\|Left\|Прав\|Right\|Сред\|Mid\|СтрНайти\|StrFind\|ВРег\|Upper\|НРег\|Lower\|ТРег\|Title\|Символ\|Char\|КодСимвола\|CharCode\|ПустаяСтрока\|IsBlankString\|СтрЗаменить\|StrReplace\|СтрЧислоСтрок\|StrLineCount\|СтрПолучитьСтроку\|StrGetLine\|СтрЧислоВхождений\|StrOccurrenceCount\|СтрСравнить\|StrCompare\|СтрНачинаетсяС\|StrStartWith\|СтрЗаканчиваетсяНа\|StrEndsWith\|СтрРазделить\|StrSplit\|СтрСоединить\|StrConcat\)\s*\((\@=\)"

" Глобальный контекст - функции работы со значениями типа Число
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(Цел\|Int\|Окр\|Round\|ACos\|ACos\|ASin\|ASin\|ATan\|ATan\|Cos\|Cos\|Exp\|Exp\|Log\|Log\|Log10\|Log10\|Pow\|Pow\|Sin\|Sin\|Sqrt\|Sqrt\|Tan\|Tan\)\s*\((\@=\)"

" Глобальный контекст - функции работы со значениями типа Дата
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(Год\|Year\|Месяц\|Month\|День\|Day\|Час\|Hour\|Минута\|Minute\|Секунда\|Second\|НачалоГода\|BegOfYear\|НачалоДня\|BegOfDay\|НачалоКвартала\|BegOfQuarter\|НачалоМесяца\|BegOfMonth\|НачалоМинуты\|BegOfMinute\|НачалоНедели\|BegOfWeek\|НачалоЧаса\|BegOfHour\|КонецГода\|EndOfYear\|КонецДня\|EndOfDay\|КонецКвартала\|EndOfQuarter\|КонецМесяца\|EndOfMonth\|КонецМинуты\|EndOfMinute\|КонецНедели\|EndOfWeek\|КонецЧаса\|EndOfHour\|НеделяГода\|WeekOfYear\|ДеньГода\|DayOfYear\|ДеньНедели\|WeekDay\|ТекущаяДата\|CurrentDate\|ДобавитьМесяц\|AddMonth\)\s*\((\@=\)"
	 
" Глобальный контекст - функции работы со значениями типа Тип
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(Тип\|Type\|ТипЗнч\|TypeOf\)\s*\((\@=\)"

" Глобальный контекст - функции преобразования значений
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(Булево\|Boolean\|Число\|Number\|Строка\|String\|Дата\|Date\)\s*\((\@=\)"

" Глобальный контекст - процедуры и функции интерактивной работы
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ПоказатьВопрос\|ShowQueryBox\|Вопрос\|DoQueryBox\|ПоказатьПредупреждение\|ShowMessageBox\|Предупреждение\|DoMessageBox\|Сообщить\|Message\|ОчиститьСообщения\|ClearMessages\|ОповеститьОбИзменении\|NotifyChanged\|Состояние\|Status\|Сигнал\|Beep\|ПоказатьЗначение\|ShowValue\|ОткрытьЗначение\|OpenValue\|Оповестить\|Notify\|ОбработкаПрерыванияПользователя\|UserInterruptProcessing\|ОткрытьСодержаниеСправки\|OpenHelpContent\|ОткрытьИндексСправки\|OpenHelpIndex\|ОткрытьСправку\|OpenHelp\|ПоказатьИнформациюОбОшибке\|ShowErrorInfo\|КраткоеПредставлениеОшибки\|BriefErrorDescription\|ПодробноеПредставлениеОшибки\|DetailErrorDescription\|ПолучитьФорму\|GetForm\|ЗакрытьСправку\|CloseHelp\|ПоказатьОповещениеПользователя\|ShowUserNotification\|ОткрытьФорму\|OpenForm\|ОткрытьФормуМодально\|OpenFormModal\|АктивноеОкно\|ActiveWindow\|ВыполнитьОбработкуОповещения\|ExecuteNotifyProcessing\)\s*\((\@=\)"

 " Глобальный контекст - функции для вызова диалога ввода данных
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ПоказатьВводЗначения\|ShowInputValue\|ВвестиЗначение\|InputValue\|ПоказатьВводЧисла\|ShowInputNumber\|ВвестиЧисло\|InputNumber\|ПоказатьВводСтроки\|ShowInputString\|ВвестиСтроку\|InputString\|ПоказатьВводДаты\|ShowInputDate\|ВвестиДату\|InputDate\)\s*\((\@=\)"
	 
" Глобальный контекст - функции форматирования
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(Формат\|Format\|ЧислоПрописью\|NumberInWords\|НСтр\|NStr\|ПредставлениеПериода\|PeriodPresentation\|СтрШаблон\|StrTemplate\)\s*\((\@=\)"
	 
"Глобальный контекст - функции обращения к конфигурации
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ПолучитьОбщийМакет\|GetCommonTemplate\|ПолучитьОбщуюФорму\|GetCommonForm\|ПредопределенноеЗначение\|PredefinedValue\|ПолучитьПолноеИмяПредопределенногоЗначения\|GetPredefinedValueFullName\)\s*\((\@=\)"

 "Глобальный контекст - процедуры и функции сеанса работы
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ПолучитьЗаголовокСистемы\|GetCaption\|ПолучитьСкоростьКлиентскогоСоединения\|GetClientConnectionSpeed\|ПодключитьОбработчикОжидания\|AttachIdleHandler\|УстановитьЗаголовокСистемы\|SetCaption\|ОтключитьОбработчикОжидания\|DetachIdleHandler\|ИмяКомпьютера\|ComputerName\|ЗавершитьРаботуСистемы\|Exit\|ИмяПользователя\|UserName\|ПрекратитьРаботуСистемы\|Terminate\|ПолноеИмяПользователя\|UserFullName\|ЗаблокироватьРаботуПользователя\|LockApplication\|КаталогПрограммы\|BinDir\|КаталогВременныхФайлов\|TempFilesDir\|ПравоДоступа\|AccessRight\|РольДоступна\|IsInRole\|ТекущийЯзык\|CurrentLanguage\|ТекущийКодЛокализации\|CurrentLocaleCode\|СтрокаСоединенияИнформационнойБазы\|InfoBaseConnectionString\|ПодключитьОбработчикОповещения\|AttachNotificationHandler\|ОтключитьОбработчикОповещения\|DetachNotificationHandler\|ПолучитьСообщенияПользователю\|GetUserMessages\|ПараметрыДоступа\|AccessParameters\|ПредставлениеПриложения\|ApplicationPresentation\|ТекущийЯзыкСистемы\|CurrentSystemLanguage\|ЗапуститьСистему\|RunSystem\|ТекущийРежимЗапуска\|CurrentRunMode\|УстановитьЧасовойПоясСеанса\|SetSessionTimeZone\|ЧасовойПоясСеанса\|SessionTimeZone\|ТекущаяДатаСеанса\|CurrentSessionDate\|УстановитьКраткийЗаголовокПриложения\|SetShortApplicationCaption\|ПолучитьКраткийЗаголовокПриложения\|GetShortApplicationCaption\|ПредставлениеПрава\|RightPresentation\|ВыполнитьПроверкуПравДоступа\|VerifyAccessRights\|РабочийКаталогДанныхПользователя\|UserDataWorkDir\|КаталогДокументов\|DocumentsDir\|ПолучитьИнформациюЭкрановКлиента\|GetClientDisplaysInformation\|ТекущийВариантОсновногоШрифтаКлиентскогоПриложения\|ClientApplicationBaseFontCurrentVariant\|ТекущийВариантИнтерфейсаКлиентскогоПриложения\|ClientApplicationInterfaceCurrentVariant\|УстановитьЗаголовокКлиентскогоПриложения\|SetClientApplicationCaption\|ПолучитьЗаголовокКлиентскогоПриложения\|GetClientApplicationCaption\|НачатьПолучениеКаталогаВременныхФайлов\|BeginGettingTempFilesDir\|НачатьПолучениеКаталогаДокументов\|BeginGettingDocumentsDir\|НачатьПолучениеРабочегоКаталогаДанныхПользователя\|BeginGettingUserDataWorkDir\|ПодключитьОбработчикЗапросаНастроекКлиентаЛицензирования\|AttachLicensingClientParametersRequestHandler\|ОтключитьОбработчикЗапросаНастроекКлиентаЛицензирования\|DetachLicensingClientParametersRequestHandler\)\s*\((\@=\)"

"Глобальный контекст - процедуры и функции сохранения значений
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ЗначениеВСтрокуВнутр\|ValueToStringInternal\|ЗначениеИзСтрокиВнутр\|ValueFromStringInternal\|ЗначениеВФайл\|ValueToFile\|ЗначениеИзФайла\|ValueFromFile\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с операционной системой
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(КомандаСистемы\|System\|ЗапуститьПриложение\|RunApp\|ПолучитьCOMОбъект\|GetCOMObject\|ПользователиОС\|OSUsers\|НачатьЗапускПриложения\|BeginRunningApplication\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с внешними компонентами
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ПодключитьВнешнююКомпоненту\|AttachAddIn\|НачатьУстановкуВнешнейКомпоненты\|BeginInstallAddIn\|УстановитьВнешнююКомпоненту\|InstallAddIn\|НачатьПодключениеВнешнейКомпоненты\|BeginAttachingAddIn\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с файлами
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(КопироватьФайл\|FileCopy\|ПереместитьФайл\|MoveFile\|УдалитьФайлы\|DeleteFiles\|НайтиФайлы\|FindFiles\|СоздатьКаталог\|CreateDirectory\|ПолучитьИмяВременногоФайла\|GetTempFileName\|РазделитьФайл\|SplitFile\|ОбъединитьФайлы\|MergeFiles\|ПолучитьФайл\|GetFile\|НачатьПомещениеФайла\|BeginPutFile\|ПоместитьФайл\|PutFile\|ЭтоАдресВременногоХранилища\|IsTempStorageURL\|УдалитьИзВременногоХранилища\|DeleteFromTempStorage\|ПолучитьИзВременногоХранилища\|GetFromTempStorage\|ПоместитьВоВременноеХранилище\|PutToTempStorage\|ПодключитьРасширениеРаботыСФайлами\|AttachFileSystemExtension\|НачатьУстановкуРасширенияРаботыСФайлами\|BeginInstallFileSystemExtension\|УстановитьРасширениеРаботыСФайлами\|InstallFileSystemExtension\|ПолучитьФайлы\|GetFiles\|ПоместитьФайлы\|PutFiles\|ЗапроситьРазрешениеПользователя\|RequestUserPermission\|ПолучитьМаскуВсеФайлы\|GetAllFilesMask\|ПолучитьМаскуВсеФайлыКлиента\|GetClientAllFilesMask\|ПолучитьМаскуВсеФайлыСервера\|GetServerAllFilesMask\|ПолучитьРазделительПути\|GetPathSeparator\|ПолучитьРазделительПутиКлиента\|GetClientPathSeparator\|ПолучитьРазделительПутиСервера\|GetServerPathSeparator\|НачатьПодключениеРасширенияРаботыСФайлами\|BeginAttachingFileSystemExtension\|НачатьЗапросРазрешенияПользователя\|BeginRequestingUserPermission\|НачатьПоискФайлов\|BeginFindingFiles\|НачатьСозданиеКаталога\|BeginCreatingDirectory\|НачатьКопированиеФайла\|BeginCopyingFile\|НачатьПеремещениеФайла\|BeginMovingFile\|НачатьУдалениеФайлов\|BeginDeletingFiles\|НачатьПолучениеФайлов\|BeginGettingFiles\|НачатьПомещениеФайлов\|BeginPuttingFiles\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с информационной базой
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(НачатьТранзакцию\|BeginTransaction\|ЗафиксироватьТранзакцию\|CommitTransaction\|ОтменитьТранзакцию\|RollbackTransaction\|УстановитьМонопольныйРежим\|SetExclusiveMode\|МонопольныйРежим\|ExclusiveMode\|ПолучитьОперативнуюОтметкуВремени\|GetRealTimeTimestamp\|ПолучитьСоединенияИнформационнойБазы\|GetInfoBaseConnections\|НомерСоединенияИнформационнойБазы\|InfoBaseConnectionNumber\|КонфигурацияИзменена\|ConfigurationChanged\|КонфигурацияБазыДанныхИзмененаДинамически\|DataBaseConfigurationChangedDynamically\|УстановитьВремяОжиданияБлокировкиДанных\|SetLockWaitTime\|ОбновитьНумерациюОбъектов\|RefreshObjectsNumbering\|ПолучитьВремяОжиданияБлокировкиДанных\|GetLockWaitTime\|КодЛокализацииИнформационнойБазы\|InfoBaseLocaleCode\|УстановитьМинимальнуюДлинуПаролейПользователей\|SetUserPasswordMinLength\|ПолучитьМинимальнуюДлинуПаролейПользователей\|GetUserPasswordMinLength\|ИнициализироватьПредопределенныеДанные\|InitializePredefinedData\|УдалитьДанныеИнформационнойБазы\|EraseInfoBaseData\|УстановитьПроверкуСложностиПаролейПользователей\|SetUserPasswordStrengthCheck\|ПолучитьПроверкуСложностиПаролейПользователей\|GetUserPasswordStrengthCheck\|ПолучитьСтруктуруХраненияБазыДанных\|GetDBStorageStructureInfo\|УстановитьПривилегированныйРежим\|SetPrivilegedMode\|ПривилегированныйРежим\|PrivilegedMode\|ТранзакцияАктивна\|TransactionActive\|НеобходимостьЗавершенияСоединения\|ConnectionStopRequest\|НомерСеансаИнформационнойБазы\|InfoBaseSessionNumber\|ПолучитьСеансыИнформационнойБазы\|GetInfoBaseSessions\|ЗаблокироватьДанныеДляРедактирования\|LockDataForEdit\|УстановитьСоединениеСВнешнимИсточникомДанных\|ConnectExternalDataSource\|РазблокироватьДанныеДляРедактирования\|UnlockDataForEdit\|РазорватьСоединениеСВнешнимИсточникомДанных\|DisconnectExternalDataSource\|ПолучитьБлокировкуСеансов\|GetSessionsLock\|УстановитьБлокировкуСеансов\|SetSessionsLock\|ОбновитьПовторноИспользуемыеЗначения\|RefreshReusableValues\|УстановитьБезопасныйРежим\|SetSafeMode\|БезопасныйРежим\|SafeMode\|ПолучитьДанныеВыбора\|GetChoiceData\|УстановитьЧасовойПоясИнформационнойБазы\|SetInfoBaseTimeZone\|ПолучитьЧасовойПоясИнформационнойБазы\|GetInfoBaseTimeZone\|ПолучитьОбновлениеКонфигурацииБазыДанных\|GetDataBaseConfigurationUpdate\|УстановитьБезопасныйРежимРазделенияДанных\|SetDataSeparationSafeMode\|БезопасныйРежимРазделенияДанных\|DataSeparationSafeMode\|УстановитьВремяЗасыпанияПассивногоСеанса\|SetPassiveSessionHibernateTime\|ПолучитьВремяЗасыпанияПассивногоСеанса\|GetPassiveSessionHibernateTime\|УстановитьВремяЗавершенияСпящегоСеанса\|SetHibernateSessionTerminateTime\|ПолучитьВремяЗавершенияСпящегоСеанса\|GetHibernateSessionTerminateTime\|ПолучитьТекущийСеансИнформационнойБазы\|GetCurrentInfoBaseSession\|ПолучитьИдентификаторКонфигурации\|GetConfigurationID\|УстановитьНастройкиКлиентаЛицензирования\|SetLicensingClientParameters\|ПолучитьИмяКлиентаЛицензирования\|GetLicensingClientName\|ПолучитьДополнительныйПараметрКлиентаЛицензирования\|GetLicensingClientAdditionalParameter\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с данными информационной базы
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(НайтиПомеченныеНаУдаление\|FindMarkedForDeletion\|НайтиПоСсылкам\|FindByRef\|УдалитьОбъекты\|DeleteObjects\|УстановитьОбновлениеПредопределенныхДанныхИнформационнойБазы\|SetInfoBasePredefinedDataUpdate\|ПолучитьОбновлениеПредопределенныхДанныхИнформационнойБазы\|GetInfoBasePredefinedData\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с XML
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(XMLСтрока\|XMLString\|XMLЗначение\|XMLValue\|XMLТип\|XMLType\|XMLТипЗнч\|XMLTypeOf\|ИзXMLТипа\|FromXMLType\|ВозможностьЧтенияXML\|CanReadXML\|ПолучитьXMLТип\|GetXMLType\|ПрочитатьXML\|ReadXML\|ЗаписатьXML\|WriteXML\|НайтиНедопустимыеСимволыXML\|FindDisallowedXMLCharacters\|ИмпортМоделиXDTO\|ImportXDTOModel\|СоздатьФабрикуXDTO\|CreateXDTOFactory\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с JSON
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ЗаписатьJSON\|WriteJSON\|ПрочитатьJSON\|ReadJSON\|ПрочитатьДатуJSON\|ReadJSONDate\|ЗаписатьДатуJSON\|WriteJSONDate\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с журналом регистрации
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ЗаписьЖурналаРегистрации\|WriteLogEvent\|ПолучитьИспользованиеЖурналаРегистрации\|GetEventLogUsing\|УстановитьИспользованиеЖурналаРегистрации\|SetEventLogUsing\|ПредставлениеСобытияЖурналаРегистрации\|EventLogEventPresentation\|ВыгрузитьЖурналРегистрации\|UnloadEventLog\|ПолучитьЗначенияОтбораЖурналаРегистрации\|GetEventLogFilterValues\|УстановитьИспользованиеСобытияЖурналаРегистрации\|SetEventLogEventUse\|ПолучитьИспользованиеСобытияЖурналаРегистрации\|GetEventLogEventUse\|СкопироватьЖурналРегистрации\|CopyEventLog\|ОчиститьЖурналРегистрации\|ClearEventLog\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с универсальными объектами
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ЗначениеВДанныеФормы\|ValueToFormData\|ДанныеФормыВЗначение\|FormDataToValue\|КопироватьДанныеФормы\|CopyFormData\|УстановитьСоответствиеОбъектаИФормы\|SetObjectAndFormConformity\|ПолучитьСоответствиеОбъектаИФормы\|GetObjectAndFormConformity\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с функциональными опциями
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ПолучитьФункциональнуюОпцию\|GetFunctionalOption\|ПолучитьФункциональнуюОпциюИнтерфейса\|GetInterfaceFunctionalOption\|УстановитьПараметрыФункциональныхОпцийИнтерфейса\|SetInterfaceFunctionalOptionParameters\|ПолучитьПараметрыФункциональныхОпцийИнтерфейса\|GetInterfaceFunctionalOptionParameters\|ОбновитьИнтерфейс\|RefreshInterface\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы с криптографией
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(УстановитьРасширениеРаботыСКриптографией\|InstallCryptoExtension\|НачатьУстановкуРасширенияРаботыСКриптографией\|BeginInstallCryptoExtension\|ПодключитьРасширениеРаботыСКриптографией\|AttachCryptoExtension\|НачатьПодключениеРасширенияРаботыСКриптографией\|BeginAttachingCryptoExtension\)\s*\((\@=\)"

 "Глобальный контекст - Процедуры и функции работы со стандартным интерфейсом OData
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(УстановитьСоставСтандартногоИнтерфейсаOData\|SetStandardODataInterfaceContent\|ПолучитьСоставСтандартногоИнтерфейсаOData\|GetStandardODataInterfaceContent\)\s*\((\@=\)"

 "Глобальный контекст - Прочие процедуры и функции
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(Мин\|Min\|Макс\|Max\|ОписаниеОшибки\|ErrorDescription\|Вычислить\|Eval\|ИнформацияОбОшибке\|ErrorInfo\|Base64Значение\|Base64Value\|Base64Строка\|Base64String\|ЗаполнитьЗначенияСвойств\|FillPropertyValues\|ЗначениеЗаполнено\|ValueIsFilled\|ПолучитьПредставленияНавигационныхСсылок\|GetURLsPresentations\|НайтиОкноПоНавигационнойСсылке\|FindWindowByURL\|ПолучитьОкна\|GetWindows\|ПерейтиПоНавигационнойСсылке\|GotoURL\|ПолучитьНавигационнуюСсылку\|GetURL\|ПолучитьДопустимыеКодыЛокализации\|GetAvailableLocaleCodes\|ПолучитьНавигационнуюСсылкуИнформационнойБазы\|GetInfoBaseURL\|ПредставлениеКодаЛокализации\|LocaleCodePresentation\|ПолучитьДопустимыеЧасовыеПояса\|GetAvailableTimeZones\|ПредставлениеЧасовогоПояса\|TimeZonePresentation\|ТекущаяУниверсальнаяДата\|CurrentUniversalDate\|ТекущаяУниверсальнаяДатаВМиллисекундах\|CurrentUniversalDateInMilliseconds\|МестноеВремя\|ToLocalTime\|УниверсальноеВремя\|ToUniversalTime\|ЧасовойПояс\|TimeZone\|СмещениеЛетнегоВремени\|DaylightTimeOffset\|СмещениеСтандартногоВремени\|StandardTimeOffset\|КодироватьСтроку\|EncodeString\|РаскодироватьСтроку\|DecodeString\|Найти\|Find\)\s*\((\@=\)"

 "Глобальный контекст - События приложения и сеанса
syn match support_function_bsl "\(\(\W[^а-яё.]\)\@<=\|^\)\(ПередНачаломРаботыСистемы\|BeforeStart\|ПриНачалеРаботыСистемы\|OnStart\|ПередЗавершениемРаботыСистемы\|BeforeExit\|ПриЗавершенииРаботыСистемы\|OnExit\|ОбработкаВнешнегоСобытия\|ExternEventProcessing\|УстановкаПараметровСеанса\|SessionParametersSetting\|ПриИзмененииПараметровЭкрана\|OnChangeDisplaySettings\)\s*\((\@=\)"

" Глобальный контекст - Свойства (классы)
syn keyword support_class_bsl WSСсылки WSReferences БиблиотекаКартинок PictureLib БиблиотекаМакетовОформленияКомпоновкиДанных DataCompositionAppearanceTemplateLib БиблиотекаСтилей StyleLib БизнесПроцессы BusinessProcesses ВнешниеИсточникиДанных ExternalDataSources ВнешниеОбработки ExternalDataProcessors ВнешниеОтчеты ExternalReports Документы Documents ДоставляемыеУведомления DeliverableNotifications ЖурналыДокументов DocumentJournals Задачи Tasks ИспользованиеРабочейДаты WorkingDateUse ИсторияРаботыПользователя UserWorkHistory Константы Constants КритерииОтбора FilterCriteria Метаданные Metadata Обработки DataProcessors ОтправкаДоставляемыхУведомлений DeliverableNotificationSend Отчеты Reports ПараметрыСеанса SessionParameters Перечисления Enums ПланыВидовРасчета ChartsOfCalculationTypes ПланыВидовХарактеристик ChartsOfCharacteristicTypes ПланыОбмена ExchangePlans ПланыСчетов ChartsOfAccounts ПолнотекстовыйПоиск FullTextSearch ПользователиИнформационнойБазы InfoBaseUsers Последовательности Sequences РасширенияКонфигурации ConfigurationExtensions РегистрыБухгалтерии AccountingRegisters РегистрыНакопления AccumulationRegisters РегистрыРасчета CalculationRegisters РегистрыСведений InformationRegisters РегламентныеЗадания ScheduledJobs СериализаторXDTO XDTOSerializer Справочники Catalogs СредстваГеопозиционирования LocationTools СредстваКриптографии CryptoToolsManager СредстваМультимедиа MultimediaTools СредстваПочты MailTools СредстваТелефонии TelephonyTools ФабрикаXDTO XDTOFactory ФоновыеЗадания BackgroundJobs ХранилищаНастроек SettingsStorages ВстроенныеПокупки InAppPurchases ОтображениеРекламы AdRepresentationПанельЗадачОС OSTaskbar ПроверкаВстроенныхПокупок InAppPurchasesValidation

" Глобальный контекст - Свойства (переменные)
syn keyword support_variable_bsl ГлавныйИнтерфейс MainInterface ГлавныйСтиль MainStyle ПараметрЗапуска LaunchParameter РабочаяДата WorkingDate ХранилищеВариантовОтчетов ReportsVariantsStorage ХранилищеНастроекДанныхФорм FormDataSettingsStorage ХранилищеОбщихНастроек CommonSettingsStorage ХранилищеПользовательскихНастроекДинамическихСписков DynamicListsUserSettingsStorage ХранилищеПользовательскихНастроекОтчетов ReportsUserSettingsStorage ХранилищеСистемныхНастроек SystemSettingsStorage

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
HiLink bslConstant                               Constant
HiLink constant_numeric_bsl                      Number
HiLink constant_float_bsl                        Float
HiLink constant_other_date_bsl                   Constant
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
