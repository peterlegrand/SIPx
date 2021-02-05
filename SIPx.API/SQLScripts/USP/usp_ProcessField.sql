CREATE PROCEDURE usp_ProcessField (@UserId nvarchar(450), @ProcessFieldId int)
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	ProcessFields.ProcessFieldID
	, ProcessFields.IntValue
	, ProcessFields.StringValue
	, ProcessFields.DateTimeValue
	, ProcessFields.LocationValue
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) FieldStatusName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessFields.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessFields.ModifiedDate
FROM Processes
JOIN ProcessTypeStageFields
	ON Processes.ProcessTypeStageId = ProcessTypeStageFields.ProcessTypeStageID
JOIN ProcessFields
	ON Processes.ProcessId = ProcessFields.ProcessID
JOIN ProcessTypeFields
	ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
		AND ProcessTypeStageFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
JOIN ProcessTypeStageFieldStatuses 
	ON ProcessTypeStageFieldStatuses.ProcessTypeStageFieldStatusId = ProcessTypeStageFields.ProcessTypeStageFieldStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermId = ProcessTypeStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermId = ProcessTypeStageFieldStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessFields.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessFields.ModifierID
WHERE ProcessFields.ProcessFieldId = @ProcessFieldID
	AND UIStatusName.LanguageId = @LanguageID
