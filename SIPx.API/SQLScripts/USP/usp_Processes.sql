CREATE PROCEDURE [dbo].[usp_Processes] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Processes.ProcessID
	, ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this process template')) ProcessTemplateName
	, ProcessFields.StringValue Subject
	, ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No description for this process template stage')) ProcesstemplateStage
	, Processes.ProcessMultiID
	, Processes.ProcessTemplateID
	, Processes.ProcessTemplateStageID
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Processes.ModifiedDate
FROM Processes 
JOIN ProcessFields
	ON ProcessFields.ProcessID = Processes.ProcessID
JOIN ProcessTemplateFields 
	ON ProcessTemplateFields.ProcessTemplateFieldID = ProcessFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateID, Name FROM ProcessTemplateLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateID = Processes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateID, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateLanguage
	ON DefaultProcessTemplateLanguage.ProcessTemplateID = Processes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateStageID, Name FROM ProcessTemplateStageLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateStageLanguage
	ON UserProcessTemplateStageLanguage.ProcessTemplateStageID = Processes.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageID, Name FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateStageLanguage
	ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageID = Processes.ProcessTemplateStageID
JOIN Persons Creator
	ON Creator.UserID = Processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = Processes.ModifierID
WHERE ProcessTemplateFields.ProcessTemplateFieldTypeID = 1
ORDER BY ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this process template')) 
	, ProcessFields.StringValue

