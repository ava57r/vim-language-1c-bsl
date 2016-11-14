" Vim syntax file
" Language:	1C (BSL)
" Maintainer:	Alexander Andreev <andreevlex.as@gmail.com>
" Last Change:	14/11/2016
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
syn keyword support_function_bsl contained СтрДлина StrLen СокрЛ TrimL СокрП TrimR СокрЛП TrimAll Лев Left Прав Right Сред Mid СтрНайти StrFind ВРег Upper НРег Lower ТРег Title Символ Char КодСимвола CharCode ПустаяСтрока IsBlankString СтрЗаменить StrReplace СтрЧислоСтрок StrLineCount СтрПолучитьСтроку StrGetLine СтрЧислоВхождений StrOccurrenceCount СтрСравнить StrCompare СтрНачинаетсяС StrStartWith СтрЗаканчиваетсяНа StrEndsWith СтрРазделить StrSplit СтрСоединить StrConcat 

" Глобальный контекст - функции работы со значениями типа Число
syn keyword support_function_bsl contained Цел Int Окр Round ACos ACos ASin ASin ATan ATan Cos Cos Exp Exp Log Log Log10 Log10 Pow Pow Sin Sin Sqrt Sqrt Tan Tan 

" Глобальный контекст - функции работы со значениями типа Дата
syn keyword support_function_bsl contained Год Year Месяц Month День Day Час Hour Минута Minute Секунда Second НачалоГода BegOfYear НачалоДня BegOfDay НачалоКвартала BegOfQuarter НачалоМесяца BegOfMonth НачалоМинуты BegOfMinute НачалоНедели BegOfWeek НачалоЧаса BegOfHour КонецГода EndOfYear КонецДня EndOfDay КонецКвартала EndOfQuarter КонецМесяца EndOfMonth КонецМинуты EndOfMinute КонецНедели EndOfWeek КонецЧаса EndOfHour НеделяГода WeekOfYear ДеньГода DayOfYear ДеньНедели WeekDay ТекущаяДата CurrentDate ДобавитьМесяц AddMonth 
	 
" Глобальный контекст - функции работы со значениями типа Тип
syn keyword support_function_bsl contained Тип Type ТипЗнч TypeOf 

" Глобальный контекст - функции преобразования значений
syn keyword support_function_bsl contained Булево Boolean Число Number Строка String Дата Date 

" Глобальный контекст - процедуры и функции интерактивной работы
syn keyword support_function_bsl contained ПоказатьВопрос ShowQueryBox Вопрос DoQueryBox ПоказатьПредупреждение ShowMessageBox Предупреждение DoMessageBox Сообщить Message ОчиститьСообщения ClearMessages ОповеститьОбИзменении NotifyChanged Состояние Status Сигнал Beep ПоказатьЗначение ShowValue ОткрытьЗначение OpenValue Оповестить Notify ОбработкаПрерыванияПользователя UserInterruptProcessing ОткрытьСодержаниеСправки OpenHelpContent ОткрытьИндексСправки OpenHelpIndex ОткрытьСправку OpenHelp ПоказатьИнформациюОбОшибке ShowErrorInfo КраткоеПредставлениеОшибки BriefErrorDescription ПодробноеПредставлениеОшибки DetailErrorDescription ПолучитьФорму GetForm ЗакрытьСправку CloseHelp ПоказатьОповещениеПользователя ShowUserNotification ОткрытьФорму OpenForm ОткрытьФормуМодально OpenFormModal АктивноеОкно ActiveWindow ВыполнитьОбработкуОповещения ExecuteNotifyProcessing 

 " Глобальный контекст - функции для вызова диалога ввода данных
syn keyword support_function_bsl contained ПоказатьВводЗначения ShowInputValue ВвестиЗначение InputValue ПоказатьВводЧисла ShowInputNumber ВвестиЧисло InputNumber ПоказатьВводСтроки ShowInputString ВвестиСтроку InputString ПоказатьВводДаты ShowInputDate ВвестиДату InputDate 
	 
" Глобальный контекст - функции форматирования
syn keyword support_function_bsl contained Формат Format ЧислоПрописью NumberInWords НСтр NStr ПредставлениеПериода PeriodPresentation СтрШаблон StrTemplate 
	 
"Глобальный контекст - функции обращения к конфигурации
syn keyword support_function_bsl contained ПолучитьОбщийМакет GetCommonTemplate ПолучитьОбщуюФорму GetCommonForm ПредопределенноеЗначение PredefinedValue ПолучитьПолноеИмяПредопределенногоЗначения GetPredefinedValueFullName 

 "Глобальный контекст - процедуры и функции сеанса работы
syn keyword support_function_bsl contained ПолучитьЗаголовокСистемы GetCaption ПолучитьСкоростьКлиентскогоСоединения GetClientConnectionSpeed ПодключитьОбработчикОжидания AttachIdleHandler УстановитьЗаголовокСистемы SetCaption ОтключитьОбработчикОжидания DetachIdleHandler ИмяКомпьютера ComputerName ЗавершитьРаботуСистемы Exit ИмяПользователя UserName ПрекратитьРаботуСистемы Terminate ПолноеИмяПользователя UserFullName ЗаблокироватьРаботуПользователя LockApplication КаталогПрограммы BinDir КаталогВременныхФайлов TempFilesDir ПравоДоступа AccessRight РольДоступна IsInRole ТекущийЯзык CurrentLanguage ТекущийКодЛокализации CurrentLocaleCode СтрокаСоединенияИнформационнойБазы InfoBaseConnectionString ПодключитьОбработчикОповещения AttachNotificationHandler ОтключитьОбработчикОповещения DetachNotificationHandler ПолучитьСообщенияПользователю GetUserMessages ПараметрыДоступа AccessParameters ПредставлениеПриложения ApplicationPresentation ТекущийЯзыкСистемы CurrentSystemLanguage ЗапуститьСистему RunSystem ТекущийРежимЗапуска CurrentRunMode УстановитьЧасовойПоясСеанса SetSessionTimeZone ЧасовойПоясСеанса SessionTimeZone ТекущаяДатаСеанса CurrentSessionDate УстановитьКраткийЗаголовокПриложения SetShortApplicationCaption ПолучитьКраткийЗаголовокПриложения GetShortApplicationCaption ПредставлениеПрава RightPresentation ВыполнитьПроверкуПравДоступа VerifyAccessRights РабочийКаталогДанныхПользователя UserDataWorkDir КаталогДокументов DocumentsDir ПолучитьИнформациюЭкрановКлиента GetClientDisplaysInformation ТекущийВариантОсновногоШрифтаКлиентскогоПриложения ClientApplicationBaseFontCurrentVariant ТекущийВариантИнтерфейсаКлиентскогоПриложения ClientApplicationInterfaceCurrentVariant УстановитьЗаголовокКлиентскогоПриложения SetClientApplicationCaption ПолучитьЗаголовокКлиентскогоПриложения GetClientApplicationCaption НачатьПолучениеКаталогаВременныхФайлов BeginGettingTempFilesDir НачатьПолучениеКаталогаДокументов BeginGettingDocumentsDir НачатьПолучениеРабочегоКаталогаДанныхПользователя BeginGettingUserDataWorkDir ПодключитьОбработчикЗапросаНастроекКлиентаЛицензирования AttachLicensingClientParametersRequestHandler ОтключитьОбработчикЗапросаНастроекКлиентаЛицензирования DetachLicensingClientParametersRequestHandler КаталогБиблиотекиМобильногоУстройства MobileDeviceLibraryDir 

"Глобальный контекст - процедуры и функции сохранения значений
syn keyword support_function_bsl contained ЗначениеВСтрокуВнутр ValueToStringInternal ЗначениеИзСтрокиВнутр ValueFromStringInternal ЗначениеВФайл ValueToFile ЗначениеИзФайла ValueFromFile 

 "Глобальный контекст - Процедуры и функции работы с операционной системой
syn keyword support_function_bsl contained КомандаСистемы System ЗапуститьПриложение RunApp ПолучитьCOMОбъект GetCOMObject ПользователиОС OSUsers НачатьЗапускПриложения BeginRunningApplication 

 "Глобальный контекст - Процедуры и функции работы с внешними компонентами
syn keyword support_function_bsl contained ПодключитьВнешнююКомпоненту AttachAddIn НачатьУстановкуВнешнейКомпоненты BeginInstallAddIn УстановитьВнешнююКомпоненту InstallAddIn НачатьПодключениеВнешнейКомпоненты BeginAttachingAddIn 

 "Глобальный контекст - Процедуры и функции работы с файлами
syn keyword support_function_bsl contained КопироватьФайл FileCopy ПереместитьФайл MoveFile УдалитьФайлы DeleteFiles НайтиФайлы FindFiles СоздатьКаталог CreateDirectory ПолучитьИмяВременногоФайла GetTempFileName РазделитьФайл SplitFile ОбъединитьФайлы MergeFiles ПолучитьФайл GetFile НачатьПомещениеФайла BeginPutFile ПоместитьФайл PutFile ЭтоАдресВременногоХранилища IsTempStorageURL УдалитьИзВременногоХранилища DeleteFromTempStorage ПолучитьИзВременногоХранилища GetFromTempStorage ПоместитьВоВременноеХранилище PutToTempStorage ПодключитьРасширениеРаботыСФайлами AttachFileSystemExtension НачатьУстановкуРасширенияРаботыСФайлами BeginInstallFileSystemExtension УстановитьРасширениеРаботыСФайлами InstallFileSystemExtension ПолучитьФайлы GetFiles ПоместитьФайлы PutFiles ЗапроситьРазрешениеПользователя RequestUserPermission ПолучитьМаскуВсеФайлы GetAllFilesMask ПолучитьМаскуВсеФайлыКлиента GetClientAllFilesMask ПолучитьМаскуВсеФайлыСервера GetServerAllFilesMask ПолучитьРазделительПути GetPathSeparator ПолучитьРазделительПутиКлиента GetClientPathSeparator ПолучитьРазделительПутиСервера GetServerPathSeparator НачатьПодключениеРасширенияРаботыСФайлами BeginAttachingFileSystemExtension НачатьЗапросРазрешенияПользователя BeginRequestingUserPermission НачатьПоискФайлов BeginFindingFiles НачатьСозданиеКаталога BeginCreatingDirectory НачатьКопированиеФайла BeginCopyingFile НачатьПеремещениеФайла BeginMovingFile НачатьУдалениеФайлов BeginDeletingFiles НачатьПолучениеФайлов BeginGettingFiles НачатьПомещениеФайлов BeginPuttingFiles НачатьСозданиеДвоичныхДанныхИзФайла BeginCreateBinaryDataFromFile 

 "Глобальный контекст - Процедуры и функции работы с информационной базой
syn keyword support_function_bsl contained НачатьТранзакцию BeginTransaction ЗафиксироватьТранзакцию CommitTransaction ОтменитьТранзакцию RollbackTransaction УстановитьМонопольныйРежим SetExclusiveMode МонопольныйРежим ExclusiveMode ПолучитьОперативнуюОтметкуВремени GetRealTimeTimestamp ПолучитьСоединенияИнформационнойБазы GetInfoBaseConnections НомерСоединенияИнформационнойБазы InfoBaseConnectionNumber КонфигурацияИзменена ConfigurationChanged КонфигурацияБазыДанныхИзмененаДинамически DataBaseConfigurationChangedDynamically УстановитьВремяОжиданияБлокировкиДанных SetLockWaitTime ОбновитьНумерациюОбъектов RefreshObjectsNumbering ПолучитьВремяОжиданияБлокировкиДанных GetLockWaitTime КодЛокализацииИнформационнойБазы InfoBaseLocaleCode УстановитьМинимальнуюДлинуПаролейПользователей SetUserPasswordMinLength ПолучитьМинимальнуюДлинуПаролейПользователей GetUserPasswordMinLength ИнициализироватьПредопределенныеДанные InitializePredefinedData УдалитьДанныеИнформационнойБазы EraseInfoBaseData УстановитьПроверкуСложностиПаролейПользователей SetUserPasswordStrengthCheck ПолучитьПроверкуСложностиПаролейПользователей GetUserPasswordStrengthCheck ПолучитьСтруктуруХраненияБазыДанных GetDBStorageStructureInfo УстановитьПривилегированныйРежим SetPrivilegedMode ПривилегированныйРежим PrivilegedMode ТранзакцияАктивна TransactionActive НеобходимостьЗавершенияСоединения ConnectionStopRequest НомерСеансаИнформационнойБазы InfoBaseSessionNumber ПолучитьСеансыИнформационнойБазы GetInfoBaseSessions ЗаблокироватьДанныеДляРедактирования LockDataForEdit УстановитьСоединениеСВнешнимИсточникомДанных ConnectExternalDataSource РазблокироватьДанныеДляРедактирования UnlockDataForEdit РазорватьСоединениеСВнешнимИсточникомДанных DisconnectExternalDataSource ПолучитьБлокировкуСеансов GetSessionsLock УстановитьБлокировкуСеансов SetSessionsLock ОбновитьПовторноИспользуемыеЗначения RefreshReusableValues УстановитьБезопасныйРежим SetSafeMode БезопасныйРежим SafeMode ПолучитьДанныеВыбора GetChoiceData УстановитьЧасовойПоясИнформационнойБазы SetInfoBaseTimeZone ПолучитьЧасовойПоясИнформационнойБазы GetInfoBaseTimeZone ПолучитьОбновлениеКонфигурацииБазыДанных GetDataBaseConfigurationUpdate УстановитьБезопасныйРежимРазделенияДанных SetDataSeparationSafeMode БезопасныйРежимРазделенияДанных DataSeparationSafeMode УстановитьВремяЗасыпанияПассивногоСеанса SetPassiveSessionHibernateTime ПолучитьВремяЗасыпанияПассивногоСеанса GetPassiveSessionHibernateTime УстановитьВремяЗавершенияСпящегоСеанса SetHibernateSessionTerminateTime ПолучитьВремяЗавершенияСпящегоСеанса GetHibernateSessionTerminateTime ПолучитьТекущийСеансИнформационнойБазы GetCurrentInfoBaseSession ПолучитьИдентификаторКонфигурации GetConfigurationID УстановитьНастройкиКлиентаЛицензирования SetLicensingClientParameters ПолучитьИмяКлиентаЛицензирования GetLicensingClientName ПолучитьДополнительныйПараметрКлиентаЛицензирования GetLicensingClientAdditionalParameter ПолучитьОтключениеБезопасногоРежима GetSafeModeDisabled УстановитьОтключениеБезопасногоРежима SetSafeModeDisabled 

 "Глобальный контекст - Процедуры и функции работы с данными информационной базы
syn keyword support_function_bsl contained НайтиПомеченныеНаУдаление FindMarkedForDeletion НайтиПоСсылкам FindByRef УдалитьОбъекты DeleteObjects УстановитьОбновлениеПредопределенныхДанныхИнформационнойБазы SetInfoBasePredefinedDataUpdate ПолучитьОбновлениеПредопределенныхДанныхИнформационнойБазы GetInfoBasePredefinedData 

 "Глобальный контекст - Процедуры и функции работы с XML
syn keyword support_function_bsl contained XMLСтрока XMLString XMLЗначение XMLValue XMLТип XMLType XMLТипЗнч XMLTypeOf ИзXMLТипа FromXMLType ВозможностьЧтенияXML CanReadXML ПолучитьXMLТип GetXMLType ПрочитатьXML ReadXML ЗаписатьXML WriteXML НайтиНедопустимыеСимволыXML FindDisallowedXMLCharacters ИмпортМоделиXDTO ImportXDTOModel СоздатьФабрикуXDTO CreateXDTOFactory 

 "Глобальный контекст - Процедуры и функции работы с JSON
syn keyword support_function_bsl contained ЗаписатьJSON WriteJSON ПрочитатьJSON ReadJSON ПрочитатьДатуJSON ReadJSONDate ЗаписатьДатуJSON WriteJSONDate 

 "Глобальный контекст - Процедуры и функции работы с журналом регистрации
syn keyword support_function_bsl contained ЗаписьЖурналаРегистрации WriteLogEvent ПолучитьИспользованиеЖурналаРегистрации GetEventLogUsing УстановитьИспользованиеЖурналаРегистрации SetEventLogUsing ПредставлениеСобытияЖурналаРегистрации EventLogEventPresentation ВыгрузитьЖурналРегистрации UnloadEventLog ПолучитьЗначенияОтбораЖурналаРегистрации GetEventLogFilterValues УстановитьИспользованиеСобытияЖурналаРегистрации SetEventLogEventUse ПолучитьИспользованиеСобытияЖурналаРегистрации GetEventLogEventUse СкопироватьЖурналРегистрации CopyEventLog ОчиститьЖурналРегистрации ClearEventLog 

 "Глобальный контекст - Процедуры и функции работы с универсальными объектами
syn keyword support_function_bsl contained ЗначениеВДанныеФормы ValueToFormData ДанныеФормыВЗначение FormDataToValue КопироватьДанныеФормы CopyFormData УстановитьСоответствиеОбъектаИФормы SetObjectAndFormConformity ПолучитьСоответствиеОбъектаИФормы GetObjectAndFormConformity 

 "Глобальный контекст - Процедуры и функции работы с функциональными опциями
syn keyword support_function_bsl contained ПолучитьФункциональнуюОпцию GetFunctionalOption ПолучитьФункциональнуюОпциюИнтерфейса GetInterfaceFunctionalOption УстановитьПараметрыФункциональныхОпцийИнтерфейса SetInterfaceFunctionalOptionParameters ПолучитьПараметрыФункциональныхОпцийИнтерфейса GetInterfaceFunctionalOptionParameters ОбновитьИнтерфейс RefreshInterface 

 "Глобальный контекст - Процедуры и функции работы с криптографией
syn keyword support_function_bsl contained УстановитьРасширениеРаботыСКриптографией InstallCryptoExtension НачатьУстановкуРасширенияРаботыСКриптографией BeginInstallCryptoExtension ПодключитьРасширениеРаботыСКриптографией AttachCryptoExtension НачатьПодключениеРасширенияРаботыСКриптографией BeginAttachingCryptoExtension 

 "Глобальный контекст - Процедуры и функции работы со стандартным интерфейсом OData
syn keyword support_function_bsl contained УстановитьСоставСтандартногоИнтерфейсаOData SetStandardODataInterfaceContent ПолучитьСоставСтандартногоИнтерфейсаOData GetStandardODataInterfaceContent 

" Глобальный контекст - Процедуры и функции работы с двоичными данными"
syn keyword support_function_bsl contained СоединитьБуферыДвоичныхДанных ConcatBinaryDataBuffers 

 "Глобальный контекст - Прочие процедуры и функции
syn keyword support_function_bsl contained Мин Min Макс Max ОписаниеОшибки ErrorDescription Вычислить Eval ИнформацияОбОшибке ErrorInfo Base64Значение Base64Value Base64Строка Base64String ЗаполнитьЗначенияСвойств FillPropertyValues ЗначениеЗаполнено ValueIsFilled ПолучитьПредставленияНавигационныхСсылок GetURLsPresentations НайтиОкноПоНавигационнойСсылке FindWindowByURL ПолучитьОкна GetWindows ПерейтиПоНавигационнойСсылке GotoURL ПолучитьНавигационнуюСсылку GetURL ПолучитьДопустимыеКодыЛокализации GetAvailableLocaleCodes ПолучитьНавигационнуюСсылкуИнформационнойБазы GetInfoBaseURL ПредставлениеКодаЛокализации LocaleCodePresentation ПолучитьДопустимыеЧасовыеПояса GetAvailableTimeZones ПредставлениеЧасовогоПояса TimeZonePresentation ТекущаяУниверсальнаяДата CurrentUniversalDate ТекущаяУниверсальнаяДатаВМиллисекундах CurrentUniversalDateInMilliseconds МестноеВремя ToLocalTime УниверсальноеВремя ToUniversalTime ЧасовойПояс TimeZone СмещениеЛетнегоВремени DaylightTimeOffset СмещениеСтандартногоВремени StandardTimeOffset КодироватьСтроку EncodeString РаскодироватьСтроку DecodeString Найти Find ПродолжитьВызов ProceedWithCall 

 "Глобальный контекст - События приложения и сеанса
syn keyword support_function_bsl contained ПередНачаломРаботыСистемы BeforeStart ПриНачалеРаботыСистемы OnStart ПередЗавершениемРаботыСистемы BeforeExit ПриЗавершенииРаботыСистемы OnExit ОбработкаВнешнегоСобытия ExternEventProcessing УстановкаПараметровСеанса SessionParametersSetting ПриИзмененииПараметровЭкрана OnChangeDisplaySettings 

" Глобальный контекст - Свойства (классы)
syn keyword support_class_bsl WSСсылки WSReferences БиблиотекаКартинок PictureLib БиблиотекаМакетовОформленияКомпоновкиДанных DataCompositionAppearanceTemplateLib БиблиотекаСтилей StyleLib БизнесПроцессы BusinessProcesses ВнешниеИсточникиДанных ExternalDataSources ВнешниеОбработки ExternalDataProcessors ВнешниеОтчеты ExternalReports Документы Documents ДоставляемыеУведомления DeliverableNotifications ЖурналыДокументов DocumentJournals Задачи Tasks ИнформацияОбИнтернетСоединении InternetConnectionInformation ИспользованиеРабочейДаты WorkingDateUse ИсторияРаботыПользователя UserWorkHistory Константы Constants КритерииОтбора FilterCriteria Метаданные Metadata Обработки DataProcessors ОтправкаДоставляемыхУведомлений DeliverableNotificationSend Отчеты Reports ПараметрыСеанса SessionParameters Перечисления Enums ПланыВидовРасчета ChartsOfCalculationTypes ПланыВидовХарактеристик ChartsOfCharacteristicTypes ПланыОбмена ExchangePlans ПланыСчетов ChartsOfAccounts ПолнотекстовыйПоиск FullTextSearch ПользователиИнформационнойБазы InfoBaseUsers Последовательности Sequences РасширенияКонфигурации ConfigurationExtensions РегистрыБухгалтерии AccountingRegisters РегистрыНакопления AccumulationRegisters РегистрыРасчета CalculationRegisters РегистрыСведений InformationRegisters РегламентныеЗадания ScheduledJobs СериализаторXDTO XDTOSerializer Справочники Catalogs СредстваГеопозиционирования LocationTools СредстваКриптографии CryptoToolsManager СредстваМультимедиа MultimediaTools СредстваОтображенияРекламы AdvertisingPresentationTools СредстваПочты MailTools СредстваТелефонии TelephonyTools ФабрикаXDTO ФайловыеПотоки FileStreams XDTOFactory ФоновыеЗадания BackgroundJobs ХранилищаНастроек SettingsStorages ВстроенныеПокупки InAppPurchases ОтображениеРекламы AdRepresentationПанельЗадачОС OSTaskbar ПроверкаВстроенныхПокупок InAppPurchasesValidation

" Глобальный контекст - Свойства (переменные)
syn keyword support_variable_bsl ГлавныйИнтерфейс MainInterface ГлавныйСтиль MainStyle ПараметрЗапуска LaunchParameter РабочаяДата WorkingDate ХранилищеВариантовОтчетов ReportsVariantsStorage ХранилищеНастроекДанныхФорм FormDataSettingsStorage ХранилищеОбщихНастроек CommonSettingsStorage ХранилищеПользовательскихНастроекДинамическихСписков DynamicListsUserSettingsStorage ХранилищеПользовательскихНастроекОтчетов ReportsUserSettingsStorage ХранилищеСистемныхНастроек SystemSettingsStorage

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
