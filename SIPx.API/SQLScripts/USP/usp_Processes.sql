CREATE PROCEDURE [dbo].[usp_Processes] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Processes.ProcessID
	, ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this process type')) ProcessTypeName
	, ProcessFields.StringValue Subject
	, ISNULL(UserProcessTypeStageLanguage.Name,ISNULL(DefaultProcessTypeStageLanguage.Name,'No description for this process type stage')) ProcesstypeStage
	, ISNULL(Processes.ProcessMultiID,0) ProcessMultiID
	, Processes.ProcessTypeID
	, Processes.ProcessTypeStageID
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Processes.ModifiedDate
FROM Processes 
JOIN ProcessFields
	ON ProcessFields.ProcessId = Processes.ProcessID
JOIN ProcessTypeFields 
	ON ProcessTypeFields.ProcessTypeFieldId = ProcessFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeLanguage
	ON UserProcessTypeLanguage.ProcessTypeId = Processes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeLanguage
	ON DefaultProcessTypeLanguage.ProcessTypeId = Processes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageLanguage
	ON UserProcessTypeStageLanguage.ProcessTypeStageId = Processes.ProcessTypeStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageLanguage
	ON DefaultProcessTypeStageLanguage.ProcessTypeStageId = Processes.ProcessTypeStageID
JOIN Persons Creator
	ON Creator.UserId = Processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Processes.ModifierID
WHERE ProcessTypeFields.ProcessTypeFieldTypeId = 1
ORDER BY ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this process type')) 
	, ProcessFields.StringValue

