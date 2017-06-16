" Vim syntax file
" Language:	1C (BSL)
" Maintainer:	Alexander Andreev <andreevlex.as@gmail.com>
" Last Change:	21/01/2017
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

syn match  bslOperatorPunctuation display  "[\[\]:(),;]"
syn match  bslOperator            display  "[-+/*%=<>.?]"

"Поддержка 1c-query
syntax include @bslSDBL <sfile>:p:h/sdbl.vim
unlet b:current_syntax

syn region bslCommentLineDoubleSlash  start="//" end="$" contains=bslTODO

if exists("g:sdbl_syntax_disable")
  syn region bslStringQuotedDouble      matchgroup=bslStrings start=+"+ end=+"+ 
else
  syn region bslStringQuotedDouble      matchgroup=bslStrings start=+"+ end=+"+ contains=sdblSource
  syn region sdblSource                 contained start="\%(Выбрать\|Select\(\s\+Разрешенные\|\s\+Allowed\)\?\(\s\+Различные\|\s\+Distinct\)\?\(\s\+Первые\|\s\+Top\)\?\)" end="\(\(\"[^\"]\)\@=\)" contains=@bslSDBL transparent
endif

syn match  bslConstantNumeric         display "-\=\<\d\+\>"
syn match  bslConstantFloat           display "-\=\<\d\+\.\d\+\>"
syn match  bslConstantOtherDate       "\'\%(\(\d{4}[^\d\']*\d{2}[^\d\']*\d{2}\)\([^\d\']*\d{2}[^\d\']*\d{2}\([^\d\']*\d{2}\)\?\)\?\)\'"

syn keyword bslTODO                   contained TODO FIXME

" --- Keywords ---
syn keyword bslConstantLanguage          Неопределено Истина Ложь
syn keyword bslConstantLanguage          Undefined True False NULL
syn keyword bslKeywordControl            Прервать Продолжить Возврат
syn keyword bslKeywordControl            Break Continue Return
syn keyword bslKeywordControlConditional Если Иначе ИначеЕсли Тогда КонецЕсли
syn keyword bslKeywordControlConditional If Else ElsIf Then EndIf
syn keyword bslKeywordControlException   Попытка Исключение КонецПопытки ВызватьИсключение
syn keyword bslKeywordControlException   Try Except EndTry Raise
syn keyword bslKeywordControlRepeat      Пока Для Каждого Из По Цикл КонецЦикла
syn keyword bslKeywordControlRepeat      While For Each In To Do EndDo
syn keyword bslKeywordOperatorLogical    НЕ И ИЛИ
syn keyword bslKeywordOperatorLogical    NOT AND OR
syn keyword bslStorageModifier           Экспорт Знач Перем
syn keyword bslStorageModifier           Export Val Var

" directive
syn match  bslOtherDirective "&\%(НаКлиенте\(\(НаСервере\(БезКонтекста\)\?\)\?\)\|AtClient\(\(AtServer\(NoContext\)\?\)\?\)\|НаСервере\(БезКонтекста\)\?\|AtServer\(NoContext\)\?\)"
syn region bslControlImport  start="#\(Использовать\|Use\)" end="$"
" preprocessor conditional
syn match  bslOtherPreprocessor "#\%(Если\|If\|ИначеЕсли\|ElsIf\|Иначе\|Else\|КонецЕсли\|EndIf\).*\(Тогда\|Then\)\?"
" region
syn match bslOtherSection "#\(Область\|Region\).*$"
syn match bslOtherSection "#\(КонецОбласти\|EndRegion\)"
" Annotations
syn region bslOtherAnnotation start="&\(Перед\|Before\|После\|After\|Вместо\|Around\)" end="$"
"Functions w/o brackets
syn keyword bslNameSupportFunction Новый New
" Глобальный контекст - функции работы со значениями типа Строка
syn keyword bslNameSupportFunction contained СтрДлина StrLen
syn keyword bslNameSupportFunction contained СокрЛ TrimL
syn keyword bslNameSupportFunction contained СокрП TrimR
syn keyword bslNameSupportFunction contained СокрЛП TrimAll
syn keyword bslNameSupportFunction contained Лев Left
syn keyword bslNameSupportFunction contained Прав Right
syn keyword bslNameSupportFunction contained Сред Mid
syn keyword bslNameSupportFunction contained СтрНайти StrFind
syn keyword bslNameSupportFunction contained ВРег Upper
syn keyword bslNameSupportFunction contained НРег Lower
syn keyword bslNameSupportFunction contained ТРег Title
syn keyword bslNameSupportFunction contained Символ Char
syn keyword bslNameSupportFunction contained КодСимвола CharCode
syn keyword bslNameSupportFunction contained ПустаяСтрока IsBlankString
syn keyword bslNameSupportFunction contained СтрЗаменить StrReplace
syn keyword bslNameSupportFunction contained СтрЧислоСтрок StrLineCount
syn keyword bslNameSupportFunction contained СтрПолучитьСтроку StrGetLine
syn keyword bslNameSupportFunction contained СтрЧислоВхождений StrOccurrenceCount
syn keyword bslNameSupportFunction contained СтрСравнить StrCompare
syn keyword bslNameSupportFunction contained СтрНачинаетсяС StrStartWith
syn keyword bslNameSupportFunction contained СтрЗаканчиваетсяНа StrEndsWith
syn keyword bslNameSupportFunction contained СтрРазделить StrSplit
syn keyword bslNameSupportFunction contained СтрСоединить StrConcat

" Глобальный контекст - функции работы со значениями типа Число
syn keyword bslNameSupportFunction contained Цел Int Окр Round ACos ASin ATan Cos Exp Log Log10 Pow Sin Sqrt Tan

" Глобальный контекст - функции работы со значениями типа Дата
syn keyword bslNameSupportFunction contained Год Year
syn keyword bslNameSupportFunction contained Месяц Month
syn keyword bslNameSupportFunction contained День Day
syn keyword bslNameSupportFunction contained Час Hour
syn keyword bslNameSupportFunction contained Минута Minute
syn keyword bslNameSupportFunction contained Секунда Second
syn keyword bslNameSupportFunction contained НачалоГода BegOfYear
syn keyword bslNameSupportFunction contained НачалоДня BegOfDay
syn keyword bslNameSupportFunction contained НачалоКвартала BegOfQuarter
syn keyword bslNameSupportFunction contained НачалоМесяца BegOfMonth
syn keyword bslNameSupportFunction contained НачалоМинуты BegOfMinute
syn keyword bslNameSupportFunction contained НачалоНедели BegOfWeek
syn keyword bslNameSupportFunction contained НачалоЧаса BegOfHour
syn keyword bslNameSupportFunction contained КонецГода EndOfYear
syn keyword bslNameSupportFunction contained КонецДня EndOfDay
syn keyword bslNameSupportFunction contained КонецКвартала EndOfQuarter
syn keyword bslNameSupportFunction contained КонецМесяца EndOfMonth
syn keyword bslNameSupportFunction contained КонецМинуты EndOfMinute
syn keyword bslNameSupportFunction contained КонецНедели EndOfWeek
syn keyword bslNameSupportFunction contained КонецЧаса EndOfHour
syn keyword bslNameSupportFunction contained НеделяГода WeekOfYear
syn keyword bslNameSupportFunction contained ДеньГода DayOfYear
syn keyword bslNameSupportFunction contained ДеньНедели WeekDay
syn keyword bslNameSupportFunction contained ТекущаяДата CurrentDate
syn keyword bslNameSupportFunction contained ДобавитьМесяц AddMonth

" Глобальный контекст - функции работы со значениями типа Тип
syn keyword bslNameSupportFunction contained Тип Type
syn keyword bslNameSupportFunction contained ТипЗнч TypeOf

" Глобальный контекст - функции преобразования значений
syn keyword bslNameSupportFunction contained Булево Boolean
syn keyword bslNameSupportFunction contained Число Number
syn keyword bslNameSupportFunction contained Строка String
syn keyword bslNameSupportFunction contained Дата Date

" Глобальный контекст - процедуры и функции интерактивной работы
syn keyword bslNameSupportFunction contained ПоказатьВопрос ShowQueryBox
syn keyword bslNameSupportFunction contained Вопрос DoQueryBox
syn keyword bslNameSupportFunction contained ПоказатьПредупреждение ShowMessageBox
syn keyword bslNameSupportFunction contained Предупреждение DoMessageBox
syn keyword bslNameSupportFunction contained Сообщить Message
syn keyword bslNameSupportFunction contained ОчиститьСообщения ClearMessages
syn keyword bslNameSupportFunction contained ОповеститьОбИзменении NotifyChanged
syn keyword bslNameSupportFunction contained Состояние Status
syn keyword bslNameSupportFunction contained Сигнал Beep
syn keyword bslNameSupportFunction contained ПоказатьЗначение ShowValue
syn keyword bslNameSupportFunction contained ОткрытьЗначение OpenValue
syn keyword bslNameSupportFunction contained Оповестить Notify
syn keyword bslNameSupportFunction contained ОбработкаПрерыванияПользователя UserInterruptProcessing
syn keyword bslNameSupportFunction contained ОткрытьСодержаниеСправки OpenHelpContent
syn keyword bslNameSupportFunction contained ОткрытьИндексСправки OpenHelpIndex
syn keyword bslNameSupportFunction contained ОткрытьСправку OpenHelp
syn keyword bslNameSupportFunction contained ПоказатьИнформациюОбОшибке ShowErrorInfo
syn keyword bslNameSupportFunction contained КраткоеПредставлениеОшибки BriefErrorDescription
syn keyword bslNameSupportFunction contained ПодробноеПредставлениеОшибки DetailErrorDescription
syn keyword bslNameSupportFunction contained ПолучитьФорму GetForm
syn keyword bslNameSupportFunction contained ЗакрытьСправку CloseHelp
syn keyword bslNameSupportFunction contained ПоказатьОповещениеПользователя ShowUserNotification
syn keyword bslNameSupportFunction contained ОткрытьФорму OpenForm
syn keyword bslNameSupportFunction contained ОткрытьФормуМодально OpenFormModal
syn keyword bslNameSupportFunction contained АктивноеОкно ActiveWindow
syn keyword bslNameSupportFunction contained ВыполнитьОбработкуОповещения ExecuteNotifyProcessing

 " Глобальный контекст - функции для вызова диалога ввода данных
syn keyword bslNameSupportFunction contained ПоказатьВводЗначения ShowInputValue
syn keyword bslNameSupportFunction contained ВвестиЗначение InputValue
syn keyword bslNameSupportFunction contained ПоказатьВводЧисла ShowInputNumber
syn keyword bslNameSupportFunction contained ВвестиЧисло InputNumber
syn keyword bslNameSupportFunction contained ПоказатьВводСтроки ShowInputString
syn keyword bslNameSupportFunction contained ВвестиСтроку InputString
syn keyword bslNameSupportFunction contained ПоказатьВводДаты ShowInputDate
syn keyword bslNameSupportFunction contained ВвестиДату InputDate

" Глобальный контекст - функции форматирования
syn keyword bslNameSupportFunction contained Формат Format
syn keyword bslNameSupportFunction contained ЧислоПрописью NumberInWords
syn keyword bslNameSupportFunction contained НСтр NStr
syn keyword bslNameSupportFunction contained ПредставлениеПериода PeriodPresentation
syn keyword bslNameSupportFunction contained СтрШаблон StrTemplate

"Глобальный контекст - функции обращения к конфигурации
syn keyword bslNameSupportFunction contained ПолучитьОбщийМакет GetCommonTemplate
syn keyword bslNameSupportFunction contained ПолучитьОбщуюФорму GetCommonForm
syn keyword bslNameSupportFunction contained ПредопределенноеЗначение PredefinedValue
syn keyword bslNameSupportFunction contained ПолучитьПолноеИмяПредопределенногоЗначения GetPredefinedValueFullName

 "Глобальный контекст - процедуры и функции сеанса работы
syn keyword bslNameSupportFunction contained ПолучитьЗаголовокСистемы GetCaption
syn keyword bslNameSupportFunction contained ПолучитьСкоростьКлиентскогоСоединения GetClientConnectionSpeed
syn keyword bslNameSupportFunction contained ПодключитьОбработчикОжидания AttachIdleHandler
syn keyword bslNameSupportFunction contained УстановитьЗаголовокСистемы SetCaption
syn keyword bslNameSupportFunction contained ОтключитьОбработчикОжидания DetachIdleHandler
syn keyword bslNameSupportFunction contained ИмяКомпьютера ComputerName
syn keyword bslNameSupportFunction contained ЗавершитьРаботуСистемы Exit
syn keyword bslNameSupportFunction contained ИмяПользователя UserName
syn keyword bslNameSupportFunction contained ПрекратитьРаботуСистемы Terminate
syn keyword bslNameSupportFunction contained ПолноеИмяПользователя UserFullName
syn keyword bslNameSupportFunction contained ЗаблокироватьРаботуПользователя LockApplication
syn keyword bslNameSupportFunction contained КаталогПрограммы BinDir
syn keyword bslNameSupportFunction contained КаталогВременныхФайлов TempFilesDir
syn keyword bslNameSupportFunction contained ПравоДоступа AccessRight
syn keyword bslNameSupportFunction contained РольДоступна IsInRole
syn keyword bslNameSupportFunction contained ТекущийЯзык CurrentLanguage
syn keyword bslNameSupportFunction contained ТекущийКодЛокализации CurrentLocaleCode
syn keyword bslNameSupportFunction contained СтрокаСоединенияИнформационнойБазы InfoBaseConnectionString
syn keyword bslNameSupportFunction contained ПодключитьОбработчикОповещения AttachNotificationHandler
syn keyword bslNameSupportFunction contained ОтключитьОбработчикОповещения DetachNotificationHandler
syn keyword bslNameSupportFunction contained ПолучитьСообщенияПользователю GetUserMessages
syn keyword bslNameSupportFunction contained ПараметрыДоступа AccessParameters
syn keyword bslNameSupportFunction contained ПредставлениеПриложения ApplicationPresentation
syn keyword bslNameSupportFunction contained ТекущийЯзыкСистемы CurrentSystemLanguage
syn keyword bslNameSupportFunction contained ЗапуститьСистему RunSystem
syn keyword bslNameSupportFunction contained ТекущийРежимЗапуска CurrentRunMode
syn keyword bslNameSupportFunction contained УстановитьЧасовойПоясСеанса SetSessionTimeZone
syn keyword bslNameSupportFunction contained ЧасовойПоясСеанса SessionTimeZone
syn keyword bslNameSupportFunction contained ТекущаяДатаСеанса CurrentSessionDate
syn keyword bslNameSupportFunction contained УстановитьКраткийЗаголовокПриложения SetShortApplicationCaption
syn keyword bslNameSupportFunction contained ПолучитьКраткийЗаголовокПриложения GetShortApplicationCaption
syn keyword bslNameSupportFunction contained ПредставлениеПрава RightPresentation
syn keyword bslNameSupportFunction contained ВыполнитьПроверкуПравДоступа VerifyAccessRights
syn keyword bslNameSupportFunction contained РабочийКаталогДанныхПользователя UserDataWorkDir
syn keyword bslNameSupportFunction contained КаталогДокументов DocumentsDir
syn keyword bslNameSupportFunction contained ПолучитьИнформациюЭкрановКлиента GetClientDisplaysInformation
syn keyword bslNameSupportFunction contained ТекущийВариантОсновногоШрифтаКлиентскогоПриложения ClientApplicationBaseFontCurrentVariant
syn keyword bslNameSupportFunction contained ТекущийВариантИнтерфейсаКлиентскогоПриложения ClientApplicationInterfaceCurrentVariant
syn keyword bslNameSupportFunction contained УстановитьЗаголовокКлиентскогоПриложения SetClientApplicationCaption
syn keyword bslNameSupportFunction contained ПолучитьЗаголовокКлиентскогоПриложения GetClientApplicationCaption
syn keyword bslNameSupportFunction contained НачатьПолучениеКаталогаВременныхФайлов BeginGettingTempFilesDir
syn keyword bslNameSupportFunction contained НачатьПолучениеКаталогаДокументов BeginGettingDocumentsDir
syn keyword bslNameSupportFunction contained НачатьПолучениеРабочегоКаталогаДанныхПользователя BeginGettingUserDataWorkDir
syn keyword bslNameSupportFunction contained ПодключитьОбработчикЗапросаНастроекКлиентаЛицензирования AttachLicensingClientParametersRequestHandler
syn keyword bslNameSupportFunction contained ОтключитьОбработчикЗапросаНастроекКлиентаЛицензирования DetachLicensingClientParametersRequestHandler
syn keyword bslNameSupportFunction contained КаталогБиблиотекиМобильногоУстройства MobileDeviceLibraryDir

"Глобальный контекст - процедуры и функции сохранения значений
syn keyword bslNameSupportFunction contained ЗначениеВСтрокуВнутр ValueToStringInternal
syn keyword bslNameSupportFunction contained ЗначениеИзСтрокиВнутр ValueFromStringInternal
syn keyword bslNameSupportFunction contained ЗначениеВФайл ValueToFile
syn keyword bslNameSupportFunction contained ЗначениеИзФайла ValueFromFile

 "Глобальный контекст - Процедуры и функции работы с операционной системой
syn keyword bslNameSupportFunction contained КомандаСистемы System
syn keyword bslNameSupportFunction contained ЗапуститьПриложение RunApp
syn keyword bslNameSupportFunction contained ПолучитьCOMОбъект GetCOMObject
syn keyword bslNameSupportFunction contained ПользователиОС OSUsers
syn keyword bslNameSupportFunction contained НачатьЗапускПриложения BeginRunningApplication

 "Глобальный контекст - Процедуры и функции работы с внешними компонентами
syn keyword bslNameSupportFunction contained ПодключитьВнешнююКомпоненту AttachAddIn
syn keyword bslNameSupportFunction contained НачатьУстановкуВнешнейКомпоненты BeginInstallAddIn
syn keyword bslNameSupportFunction contained УстановитьВнешнююКомпоненту InstallAddIn
syn keyword bslNameSupportFunction contained НачатьПодключениеВнешнейКомпоненты BeginAttachingAddIn

 "Глобальный контекст - Процедуры и функции работы с файлами
syn keyword bslNameSupportFunction contained КопироватьФайл FileCopy
syn keyword bslNameSupportFunction contained ПереместитьФайл MoveFile
syn keyword bslNameSupportFunction contained УдалитьФайлы DeleteFiles
syn keyword bslNameSupportFunction contained НайтиФайлы FindFiles
syn keyword bslNameSupportFunction contained СоздатьКаталог CreateDirectory
syn keyword bslNameSupportFunction contained ПолучитьИмяВременногоФайла GetTempFileName
syn keyword bslNameSupportFunction contained РазделитьФайл SplitFile
syn keyword bslNameSupportFunction contained ОбъединитьФайлы MergeFiles
syn keyword bslNameSupportFunction contained ПолучитьФайл GetFile
syn keyword bslNameSupportFunction contained НачатьПомещениеФайла BeginPutFile
syn keyword bslNameSupportFunction contained ПоместитьФайл PutFile
syn keyword bslNameSupportFunction contained ЭтоАдресВременногоХранилища IsTempStorageURL
syn keyword bslNameSupportFunction contained УдалитьИзВременногоХранилища DeleteFromTempStorage
syn keyword bslNameSupportFunction contained ПолучитьИзВременногоХранилища GetFromTempStorage
syn keyword bslNameSupportFunction contained ПоместитьВоВременноеХранилище PutToTempStorage
syn keyword bslNameSupportFunction contained ПодключитьРасширениеРаботыСФайлами AttachFileSystemExtension
syn keyword bslNameSupportFunction contained НачатьУстановкуРасширенияРаботыСФайлами BeginInstallFileSystemExtension
syn keyword bslNameSupportFunction contained УстановитьРасширениеРаботыСФайлами InstallFileSystemExtension
syn keyword bslNameSupportFunction contained ПолучитьФайлы GetFiles
syn keyword bslNameSupportFunction contained ПоместитьФайлы PutFiles
syn keyword bslNameSupportFunction contained ЗапроситьРазрешениеПользователя RequestUserPermission
syn keyword bslNameSupportFunction contained ПолучитьМаскуВсеФайлы GetAllFilesMask
syn keyword bslNameSupportFunction contained ПолучитьМаскуВсеФайлыКлиента GetClientAllFilesMask
syn keyword bslNameSupportFunction contained ПолучитьМаскуВсеФайлыСервера GetServerAllFilesMask
syn keyword bslNameSupportFunction contained ПолучитьРазделительПути GetPathSeparator
syn keyword bslNameSupportFunction contained ПолучитьРазделительПутиКлиента GetClientPathSeparator
syn keyword bslNameSupportFunction contained ПолучитьРазделительПутиСервера GetServerPathSeparator
syn keyword bslNameSupportFunction contained НачатьПодключениеРасширенияРаботыСФайлами BeginAttachingFileSystemExtension
syn keyword bslNameSupportFunction contained НачатьЗапросРазрешенияПользователя BeginRequestingUserPermission
syn keyword bslNameSupportFunction contained НачатьПоискФайлов BeginFindingFiles
syn keyword bslNameSupportFunction contained НачатьСозданиеКаталога BeginCreatingDirectory
syn keyword bslNameSupportFunction contained НачатьКопированиеФайла BeginCopyingFile
syn keyword bslNameSupportFunction contained НачатьПеремещениеФайла BeginMovingFile
syn keyword bslNameSupportFunction contained НачатьУдалениеФайлов BeginDeletingFiles
syn keyword bslNameSupportFunction contained НачатьПолучениеФайлов BeginGettingFiles
syn keyword bslNameSupportFunction contained НачатьПомещениеФайлов BeginPuttingFiles
syn keyword bslNameSupportFunction contained НачатьСозданиеДвоичныхДанныхИзФайла BeginCreateBinaryDataFromFile

 "Глобальный контекст - Процедуры и функции работы с информационной базой
syn keyword bslNameSupportFunction contained НачатьТранзакцию BeginTransaction
syn keyword bslNameSupportFunction contained ЗафиксироватьТранзакцию CommitTransaction
syn keyword bslNameSupportFunction contained ОтменитьТранзакцию RollbackTransaction
syn keyword bslNameSupportFunction contained УстановитьМонопольныйРежим SetExclusiveMode
syn keyword bslNameSupportFunction contained МонопольныйРежим ExclusiveMode
syn keyword bslNameSupportFunction contained ПолучитьОперативнуюОтметкуВремени GetRealTimeTimestamp
syn keyword bslNameSupportFunction contained ПолучитьСоединенияИнформационнойБазы GetInfoBaseConnections
syn keyword bslNameSupportFunction contained НомерСоединенияИнформационнойБазы InfoBaseConnectionNumber
syn keyword bslNameSupportFunction contained КонфигурацияИзменена ConfigurationChanged
syn keyword bslNameSupportFunction contained КонфигурацияБазыДанныхИзмененаДинамически DataBaseConfigurationChangedDynamically
syn keyword bslNameSupportFunction contained УстановитьВремяОжиданияБлокировкиДанных SetLockWaitTime
syn keyword bslNameSupportFunction contained ОбновитьНумерациюОбъектов RefreshObjectsNumbering
syn keyword bslNameSupportFunction contained ПолучитьВремяОжиданияБлокировкиДанных GetLockWaitTime
syn keyword bslNameSupportFunction contained КодЛокализацииИнформационнойБазы InfoBaseLocaleCode
syn keyword bslNameSupportFunction contained УстановитьМинимальнуюДлинуПаролейПользователей SetUserPasswordMinLength
syn keyword bslNameSupportFunction contained ПолучитьМинимальнуюДлинуПаролейПользователей GetUserPasswordMinLength
syn keyword bslNameSupportFunction contained ИнициализироватьПредопределенныеДанные InitializePredefinedData
syn keyword bslNameSupportFunction contained УдалитьДанныеИнформационнойБазы EraseInfoBaseData
syn keyword bslNameSupportFunction contained УстановитьПроверкуСложностиПаролейПользователей SetUserPasswordStrengthCheck
syn keyword bslNameSupportFunction contained ПолучитьПроверкуСложностиПаролейПользователей GetUserPasswordStrengthCheck
syn keyword bslNameSupportFunction contained ПолучитьСтруктуруХраненияБазыДанных GetDBStorageStructureInfo
syn keyword bslNameSupportFunction contained УстановитьПривилегированныйРежим SetPrivilegedMode
syn keyword bslNameSupportFunction contained ПривилегированныйРежим PrivilegedMode
syn keyword bslNameSupportFunction contained ТранзакцияАктивна TransactionActive
syn keyword bslNameSupportFunction contained НеобходимостьЗавершенияСоединения ConnectionStopRequest
syn keyword bslNameSupportFunction contained НомерСеансаИнформационнойБазы InfoBaseSessionNumber
syn keyword bslNameSupportFunction contained ПолучитьСеансыИнформационнойБазы GetInfoBaseSessions
syn keyword bslNameSupportFunction contained ЗаблокироватьДанныеДляРедактирования LockDataForEdit
syn keyword bslNameSupportFunction contained УстановитьСоединениеСВнешнимИсточникомДанных ConnectExternalDataSource
syn keyword bslNameSupportFunction contained РазблокироватьДанныеДляРедактирования UnlockDataForEdit
syn keyword bslNameSupportFunction contained РазорватьСоединениеСВнешнимИсточникомДанных DisconnectExternalDataSource
syn keyword bslNameSupportFunction contained ПолучитьБлокировкуСеансов GetSessionsLock
syn keyword bslNameSupportFunction contained УстановитьБлокировкуСеансов SetSessionsLock
syn keyword bslNameSupportFunction contained ОбновитьПовторноИспользуемыеЗначения RefreshReusableValues
syn keyword bslNameSupportFunction contained УстановитьБезопасныйРежим SetSafeMode
syn keyword bslNameSupportFunction contained БезопасныйРежим SafeMode
syn keyword bslNameSupportFunction contained ПолучитьДанныеВыбора GetChoiceData
syn keyword bslNameSupportFunction contained УстановитьЧасовойПоясИнформационнойБазы SetInfoBaseTimeZone
syn keyword bslNameSupportFunction contained ПолучитьЧасовойПоясИнформационнойБазы GetInfoBaseTimeZone
syn keyword bslNameSupportFunction contained ПолучитьОбновлениеКонфигурацииБазыДанных GetDataBaseConfigurationUpdate
syn keyword bslNameSupportFunction contained УстановитьБезопасныйРежимРазделенияДанных SetDataSeparationSafeMode
syn keyword bslNameSupportFunction contained БезопасныйРежимРазделенияДанных DataSeparationSafeMode
syn keyword bslNameSupportFunction contained УстановитьВремяЗасыпанияПассивногоСеанса SetPassiveSessionHibernateTime
syn keyword bslNameSupportFunction contained ПолучитьВремяЗасыпанияПассивногоСеанса GetPassiveSessionHibernateTime
syn keyword bslNameSupportFunction contained УстановитьВремяЗавершенияСпящегоСеанса SetHibernateSessionTerminateTime
syn keyword bslNameSupportFunction contained ПолучитьВремяЗавершенияСпящегоСеанса GetHibernateSessionTerminateTime
syn keyword bslNameSupportFunction contained ПолучитьТекущийСеансИнформационнойБазы GetCurrentInfoBaseSession
syn keyword bslNameSupportFunction contained ПолучитьИдентификаторКонфигурации GetConfigurationID
syn keyword bslNameSupportFunction contained УстановитьНастройкиКлиентаЛицензирования SetLicensingClientParameters
syn keyword bslNameSupportFunction contained ПолучитьИмяКлиентаЛицензирования GetLicensingClientName
syn keyword bslNameSupportFunction contained ПолучитьДополнительныйПараметрКлиентаЛицензирования GetLicensingClientAdditionalParameter
syn keyword bslNameSupportFunction contained ПолучитьОтключениеБезопасногоРежима GetSafeModeDisabled
syn keyword bslNameSupportFunction contained УстановитьОтключениеБезопасногоРежима SetSafeModeDisabled

 "Глобальный контекст - Процедуры и функции работы с данными информационной базы
syn keyword bslNameSupportFunction contained НайтиПомеченныеНаУдаление FindMarkedForDeletion
syn keyword bslNameSupportFunction contained НайтиПоСсылкам FindByRef
syn keyword bslNameSupportFunction contained УдалитьОбъекты DeleteObjects
syn keyword bslNameSupportFunction contained УстановитьОбновлениеПредопределенныхДанныхИнформационнойБазы SetInfoBasePredefinedDataUpdate
syn keyword bslNameSupportFunction contained ПолучитьОбновлениеПредопределенныхДанныхИнформационнойБазы GetInfoBasePredefinedData

 "Глобальный контекст - Процедуры и функции работы с XML
syn keyword bslNameSupportFunction contained XMLСтрока XMLString
syn keyword bslNameSupportFunction contained XMLЗначение XMLValue
syn keyword bslNameSupportFunction contained XMLТип XMLType
syn keyword bslNameSupportFunction contained XMLТипЗнч XMLTypeOf
syn keyword bslNameSupportFunction contained ИзXMLТипа FromXMLType
syn keyword bslNameSupportFunction contained ВозможностьЧтенияXML CanReadXML
syn keyword bslNameSupportFunction contained ПолучитьXMLТип GetXMLType
syn keyword bslNameSupportFunction contained ПрочитатьXML ReadXML
syn keyword bslNameSupportFunction contained ЗаписатьXML WriteXML
syn keyword bslNameSupportFunction contained НайтиНедопустимыеСимволыXML FindDisallowedXMLCharacters
syn keyword bslNameSupportFunction contained ИмпортМоделиXDTO ImportXDTOModel
syn keyword bslNameSupportFunction contained СоздатьФабрикуXDTO CreateXDTOFactory

 "Глобальный контекст - Процедуры и функции работы с JSON
syn keyword bslNameSupportFunction contained ЗаписатьJSON WriteJSON
syn keyword bslNameSupportFunction contained ПрочитатьJSON ReadJSON
syn keyword bslNameSupportFunction contained ПрочитатьДатуJSON ReadJSONDate
syn keyword bslNameSupportFunction contained ЗаписатьДатуJSON WriteJSONDate

 "Глобальный контекст - Процедуры и функции работы с журналом регистрации
syn keyword bslNameSupportFunction contained ЗаписьЖурналаРегистрации WriteLogEvent
syn keyword bslNameSupportFunction contained ПолучитьИспользованиеЖурналаРегистрации GetEventLogUsing
syn keyword bslNameSupportFunction contained УстановитьИспользованиеЖурналаРегистрации SetEventLogUsing
syn keyword bslNameSupportFunction contained ПредставлениеСобытияЖурналаРегистрации EventLogEventPresentation
syn keyword bslNameSupportFunction contained ВыгрузитьЖурналРегистрации UnloadEventLog
syn keyword bslNameSupportFunction contained ПолучитьЗначенияОтбораЖурналаРегистрации GetEventLogFilterValues
syn keyword bslNameSupportFunction contained УстановитьИспользованиеСобытияЖурналаРегистрации SetEventLogEventUse
syn keyword bslNameSupportFunction contained ПолучитьИспользованиеСобытияЖурналаРегистрации GetEventLogEventUse
syn keyword bslNameSupportFunction contained СкопироватьЖурналРегистрации CopyEventLog
syn keyword bslNameSupportFunction contained ОчиститьЖурналРегистрации ClearEventLog

 "Глобальный контекст - Процедуры и функции работы с универсальными объектами
syn keyword bslNameSupportFunction contained ЗначениеВДанныеФормы ValueToFormData
syn keyword bslNameSupportFunction contained ДанныеФормыВЗначение FormDataToValue
syn keyword bslNameSupportFunction contained КопироватьДанныеФормы CopyFormData
syn keyword bslNameSupportFunction contained УстановитьСоответствиеОбъектаИФормы SetObjectAndFormConformity
syn keyword bslNameSupportFunction contained ПолучитьСоответствиеОбъектаИФормы GetObjectAndFormConformity

 "Глобальный контекст - Процедуры и функции работы с функциональными опциями
syn keyword bslNameSupportFunction contained ПолучитьФункциональнуюОпцию GetFunctionalOption
syn keyword bslNameSupportFunction contained ПолучитьФункциональнуюОпциюИнтерфейса GetInterfaceFunctionalOption
syn keyword bslNameSupportFunction contained УстановитьПараметрыФункциональныхОпцийИнтерфейса SetInterfaceFunctionalOptionParameters
syn keyword bslNameSupportFunction contained ПолучитьПараметрыФункциональныхОпцийИнтерфейса GetInterfaceFunctionalOptionParameters
syn keyword bslNameSupportFunction contained ОбновитьИнтерфейс RefreshInterface

 "Глобальный контекст - Процедуры и функции работы с криптографией
syn keyword bslNameSupportFunction contained УстановитьРасширениеРаботыСКриптографией InstallCryptoExtension
syn keyword bslNameSupportFunction contained НачатьУстановкуРасширенияРаботыСКриптографией BeginInstallCryptoExtension
syn keyword bslNameSupportFunction contained ПодключитьРасширениеРаботыСКриптографией AttachCryptoExtension
syn keyword bslNameSupportFunction contained НачатьПодключениеРасширенияРаботыСКриптографией BeginAttachingCryptoExtension

 "Глобальный контекст - Процедуры и функции работы со стандартным интерфейсом OData
syn keyword bslNameSupportFunction contained УстановитьСоставСтандартногоИнтерфейсаOData SetStandardODataInterfaceContent
syn keyword bslNameSupportFunction contained ПолучитьСоставСтандартногоИнтерфейсаOData GetStandardODataInterfaceContent

" Глобальный контекст - Процедуры и функции работы с двоичными данными"
syn keyword bslNameSupportFunction contained СоединитьБуферыДвоичныхДанных ConcatBinaryDataBuffers

 "Глобальный контекст - Прочие процедуры и функции
syn keyword bslNameSupportFunction contained Мин Min
syn keyword bslNameSupportFunction contained Макс Max
syn keyword bslNameSupportFunction contained ОписаниеОшибки ErrorDescription
syn keyword bslNameSupportFunction contained Вычислить Eval
syn keyword bslNameSupportFunction contained ИнформацияОбОшибке ErrorInfo
syn keyword bslNameSupportFunction contained Base64Значение Base64Value
syn keyword bslNameSupportFunction contained Base64Строка Base64String
syn keyword bslNameSupportFunction contained ЗаполнитьЗначенияСвойств FillPropertyValues
syn keyword bslNameSupportFunction contained ЗначениеЗаполнено ValueIsFilled
syn keyword bslNameSupportFunction contained ПолучитьПредставленияНавигационныхСсылок GetURLsPresentations
syn keyword bslNameSupportFunction contained НайтиОкноПоНавигационнойСсылке FindWindowByURL
syn keyword bslNameSupportFunction contained ПолучитьОкна GetWindows
syn keyword bslNameSupportFunction contained ПерейтиПоНавигационнойСсылке GotoURL
syn keyword bslNameSupportFunction contained ПолучитьНавигационнуюСсылку GetURL
syn keyword bslNameSupportFunction contained ПолучитьДопустимыеКодыЛокализации GetAvailableLocaleCodes
syn keyword bslNameSupportFunction contained ПолучитьНавигационнуюСсылкуИнформационнойБазы GetInfoBaseURL
syn keyword bslNameSupportFunction contained ПредставлениеКодаЛокализации LocaleCodePresentation
syn keyword bslNameSupportFunction contained ПолучитьДопустимыеЧасовыеПояса GetAvailableTimeZones
syn keyword bslNameSupportFunction contained ПредставлениеЧасовогоПояса TimeZonePresentation
syn keyword bslNameSupportFunction contained ТекущаяУниверсальнаяДата CurrentUniversalDate
syn keyword bslNameSupportFunction contained ТекущаяУниверсальнаяДатаВМиллисекундах CurrentUniversalDateInMilliseconds
syn keyword bslNameSupportFunction contained МестноеВремя ToLocalTime
syn keyword bslNameSupportFunction contained УниверсальноеВремя ToUniversalTime
syn keyword bslNameSupportFunction contained ЧасовойПояс TimeZone
syn keyword bslNameSupportFunction contained СмещениеЛетнегоВремени DaylightTimeOffset
syn keyword bslNameSupportFunction contained СмещениеСтандартногоВремени StandardTimeOffset
syn keyword bslNameSupportFunction contained КодироватьСтроку EncodeString
syn keyword bslNameSupportFunction contained РаскодироватьСтроку DecodeString
syn keyword bslNameSupportFunction contained Найти Find
syn keyword bslNameSupportFunction contained ПродолжитьВызов ProceedWithCall

 "Глобальный контекст - События приложения и сеанса
syn keyword bslNameSupportFunction contained ПередНачаломРаботыСистемы BeforeStart
syn keyword bslNameSupportFunction contained ПриНачалеРаботыСистемы OnStart
syn keyword bslNameSupportFunction contained ПередЗавершениемРаботыСистемы BeforeExit
syn keyword bslNameSupportFunction contained ПриЗавершенииРаботыСистемы OnExit
syn keyword bslNameSupportFunction contained ОбработкаВнешнегоСобытия ExternEventProcessing
syn keyword bslNameSupportFunction contained УстановкаПараметровСеанса SessionParametersSetting
syn keyword bslNameSupportFunction contained ПриИзмененииПараметровЭкрана OnChangeDisplaySettings

" Глобальный контекст - Свойства (классы)
syn keyword bslSupportClass WSСсылки WSReferences
syn keyword bslSupportClass БиблиотекаКартинок PictureLib
syn keyword bslSupportClass БиблиотекаМакетовОформленияКомпоновкиДанных DataCompositionAppearanceTemplateLib
syn keyword bslSupportClass БиблиотекаСтилей StyleLib
syn keyword bslSupportClass БизнесПроцессы BusinessProcesses
syn keyword bslSupportClass ВнешниеИсточникиДанных ExternalDataSources
syn keyword bslSupportClass ВнешниеОбработки ExternalDataProcessors
syn keyword bslSupportClass ВнешниеОтчеты ExternalReports
syn keyword bslSupportClass Документы Documents
syn keyword bslSupportClass ДоставляемыеУведомления DeliverableNotifications
syn keyword bslSupportClass ЖурналыДокументов DocumentJournals
syn keyword bslSupportClass Задачи Tasks
syn keyword bslSupportClass ИнформацияОбИнтернетСоединении InternetConnectionInformation
syn keyword bslSupportClass ИспользованиеРабочейДаты WorkingDateUse
syn keyword bslSupportClass ИсторияРаботыПользователя UserWorkHistory
syn keyword bslSupportClass Константы Constants
syn keyword bslSupportClass КритерииОтбора FilterCriteria
syn keyword bslSupportClass Метаданные Metadata
syn keyword bslSupportClass Обработки DataProcessors
syn keyword bslSupportClass ОтправкаДоставляемыхУведомлений DeliverableNotificationSend
syn keyword bslSupportClass Отчеты Reports
syn keyword bslSupportClass ПараметрыСеанса SessionParameters
syn keyword bslSupportClass Перечисления Enums
syn keyword bslSupportClass ПланыВидовРасчета ChartsOfCalculationTypes
syn keyword bslSupportClass ПланыВидовХарактеристик ChartsOfCharacteristicTypes
syn keyword bslSupportClass ПланыОбмена ExchangePlans
syn keyword bslSupportClass ПланыСчетов ChartsOfAccounts
syn keyword bslSupportClass ПолнотекстовыйПоиск FullTextSearch
syn keyword bslSupportClass ПользователиИнформационнойБазы InfoBaseUsers
syn keyword bslSupportClass Последовательности Sequences
syn keyword bslSupportClass РасширенияКонфигурации ConfigurationExtensions
syn keyword bslSupportClass РегистрыБухгалтерии AccountingRegisters
syn keyword bslSupportClass РегистрыНакопления AccumulationRegisters
syn keyword bslSupportClass РегистрыРасчета CalculationRegisters
syn keyword bslSupportClass РегистрыСведений InformationRegisters
syn keyword bslSupportClass РегламентныеЗадания ScheduledJobs
syn keyword bslSupportClass СериализаторXDTO XDTOSerializer
syn keyword bslSupportClass Справочники Catalogs
syn keyword bslSupportClass СредстваГеопозиционирования LocationTools
syn keyword bslSupportClass СредстваКриптографии CryptoToolsManager
syn keyword bslSupportClass СредстваМультимедиа MultimediaTools
syn keyword bslSupportClass СредстваОтображенияРекламы AdvertisingPresentationTools
syn keyword bslSupportClass СредстваПочты MailTools
syn keyword bslSupportClass СредстваТелефонии TelephonyTools
syn keyword bslSupportClass ФабрикаXDTO XDTOFactory
syn keyword bslSupportClass ФайловыеПотоки FileStreams
syn keyword bslSupportClass ФоновыеЗадания BackgroundJobs
syn keyword bslSupportClass ХранилищаНастроек SettingsStorages
syn keyword bslSupportClass ВстроенныеПокупки InAppPurchases
syn keyword bslSupportClass ОтображениеРекламы AdRepresentation
syn keyword bslSupportClass ПанельЗадачОС OSTaskbar
syn keyword bslSupportClass ПроверкаВстроенныхПокупок InAppPurchasesValidation

" Глобальный контекст - Свойства (переменные)
syn keyword bslSupportVariable ГлавныйИнтерфейс MainInterface
syn keyword bslSupportVariable ГлавныйСтиль MainStyle
syn keyword bslSupportVariable ПараметрЗапуска LaunchParameter
syn keyword bslSupportVariable РабочаяДата WorkingDate
syn keyword bslSupportVariable ХранилищеВариантовОтчетов ReportsVariantsStorage
syn keyword bslSupportVariable ХранилищеНастроекДанныхФорм FormDataSettingsStorage
syn keyword bslSupportVariable ХранилищеОбщихНастроек CommonSettingsStorage
syn keyword bslSupportVariable ХранилищеПользовательскихНастроекДинамическихСписков DynamicListsUserSettingsStorage
syn keyword bslSupportVariable ХранилищеПользовательскихНастроекОтчетов ReportsUserSettingsStorage
syn keyword bslSupportVariable ХранилищеСистемныхНастроек SystemSettingsStorage

syn match bslSupportFunction  "\%([^.]\@1<=\|^\)\%(\<\%([a-z0-9_а-яё]\+\)*\>\)\ze\s*(" contains=bslNameSupportFunction

" Поддержка сворачивания кода
if exists("bsl_fold")
    syn match bslKeywordStatement "\<\(Функция\|Function\)\>"
    syn match bslKeywordStatement "\<\(КонецФункции\|EndFunction\)\>"
    syn region bslFunctionFold
	\ matchgroup=bslKeywordStatement
	\ start="\c\<\(функция\|function\)\>"
	\ end="\c\<\(конецфункции\|endfunction\)\>"
	\ transparent fold
	\ keepend

    syn match bslKeywordStatement "\<\(Процедура\|Procedure\)\>"
    syn match bslKeywordStatement "\<\(КонецПроцедуры\|EndProcedure\)\>"
    syn region bslProcedureFold
	\ matchgroup=bslKeywordStatement
	\ start="\c\<\(процедура\|procedure\)\>"
	\ end="\c\<\(конецпроцедуры\|endprocedure\)\>"
	\ transparent fold
        \ keepend

   syn region bslOtherSectionFold
	\ matchgroup=bslOtherSection
	\ start="#\(Область\|Region\)"
	\ end="#\(КонецОбласти\|EndRegion\)"
	\ transparent fold
        \ extend


    syn sync match bslSync	grouphere bslFunctionFold  "\<\(Функция\|Function\)\>"
    syn sync match bslSync	grouphere bslProcedureFold "\<\(Процедура\|Procedure\)\>"
    syn sync match bslSync	grouphere bslOtherSectionFold "#\(Область\|Region\)"

    setlocal foldmethod=syntax
else
    syn keyword bslKeywordStatement    Процедура КонецПроцедуры Функция КонецФункции
    syn keyword bslKeywordStatement    Procedure EndProcedure Function EndFunction
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

HiLink bslOperatorPunctuation          Operator
HiLink bslOperator                     Operator
HiLink bslCommentLineDoubleSlash       Comment
HiLink bslStringQuotedDouble           String
HiLink bslConstantNumeric              Number
HiLink bslConstantFloat                Float
HiLink bslConstantOtherDate            Constant
HiLink bslTODO                         Todo
HiLink bslConstantLanguage             Constant
HiLink bslKeywordStatement             Statement
HiLink bslKeywordControl               Keyword
HiLink bslKeywordControlConditional    Conditional
HiLink bslKeywordControlException      Exception
HiLink bslKeywordControlRepeat         Repeat
HiLink bslKeywordOperatorLogical       Operator
HiLink bslStorageModifier              Type
HiLink bslOtherDirective               Define
HiLink bslControlImport                Include
HiLink bslOtherPreprocessor            PreCondit
HiLink bslOtherSection                 PreProc
HiLink bslOtherAnnotation              Define
HiLink bslNameSupportFunction          Function
HiLink bslSupportClass                 Type
HiLink bslSupportVariable              Constant

delcommand HiLink
endif

let b:current_syntax = "bsl"

if main_syntax == 'bsl'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
