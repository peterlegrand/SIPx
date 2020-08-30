CREATE PROCEDURE [dbo].[usp_ProcessMultiIndexGet] (@UserId nvarchar(450), @ProcessMultiId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Processes.ProcessID
	, ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this process template')) ProcessTemplateName
	, ProcessFields.StringValue Subject
	, ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No description for this process template stage')) ProcesstemplateStage
	, ISNULL(Processes.ProcessMultiID,0) ProcessMultiID
	, Processes.ProcessTemplateID
	, Processes.ProcessTemplateStageID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Processes.CreatedDate
FROM Processes 
JOIN ProcessFields
	ON ProcessFields.ProcessId = Processes.ProcessID
JOIN ProcessTemplateFields 
	ON ProcessTemplateFields.ProcessTemplateFieldId = ProcessFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateId = Processes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateLanguage
	ON DefaultProcessTemplateLanguage.ProcessTemplateId = Processes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageLanguage
	ON UserProcessTemplateStageLanguage.ProcessTemplateStageId = Processes.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageLanguage
	ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageId = Processes.ProcessTemplateStageID
JOIN Persons Creator
	ON Creator.UserId = Processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Processes.ModifierID
WHERE ProcessTemplateFields.ProcessTemplateFieldTypeId = 1
	AND @ProcessMultiId = Processes.ProcessMultiID
ORDER BY ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this process template')) 
	, ProcessFields.StringValue

