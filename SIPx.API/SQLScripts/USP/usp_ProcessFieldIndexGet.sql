CREATE PROCEDURE usp_ProcessFieldIndexGet (@UserId nvarchar(450), @ProcessId int)
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
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessFields.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, ProcessFields.ModifiedDate
FROM Processes
JOIN ProcessTemplateStageFields
	ON Processes.ProcessTemplateStageId = ProcessTemplateStageFields.ProcessTemplateStageID
JOIN ProcessFields
	ON Processes.ProcessId = ProcessFields.ProcessID
JOIN ProcessTemplateFields
	ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
		AND ProcessTemplateStageFields.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
JOIN ProcessTemplateStageFieldStatuses 
	ON ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusId = ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessFields.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessFields.ModifierID
WHERE Processes.ProcessId = @ProcessID
	AND UIStatusName.LanguageId = @LanguageID
ORDER BY ProcessTemplateStageFields.Sequence