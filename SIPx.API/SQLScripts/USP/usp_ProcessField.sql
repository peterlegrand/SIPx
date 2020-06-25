CREATE PROCEDURE usp_ProcessField (@UserID nvarchar(450), @ProcessFieldID int)
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	Processes.ProcessID
	, ProcessFields.ProcessFieldID
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
JOIN ProcessTemplateStageFields
	ON Processes.ProcessTemplateStageID = ProcessTemplateStageFields.ProcessTemplateStageID
JOIN ProcessFields
	ON Processes.ProcessID = ProcessFields.ProcessID
JOIN ProcessTemplateFields
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
		AND ProcessTemplateStageFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
JOIN ProcessTemplateStageFieldStatuses 
	ON ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusID = ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermID = ProcessTemplateStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermID = ProcessTemplateStageFieldStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessFields.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessFields.ModifierID
WHERE ProcessFields.ProcessFieldID = @ProcessFieldID
	AND UIStatusName.LanguageID = @LanguageID