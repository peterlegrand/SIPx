CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldList] (@UserId nvarchar(450), @ProcessTemplateId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateStageFields.Sequence
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this role')) Name
FROM ProcessTemplateFields 
JOIN ProcessTemplateStageFields
	ON ProcessTemplateFields.ProcessTemplateFieldID = ProcessTemplateStageFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
WHERE ProcessTemplateFields.ProcessTemplateId = @ProcessTemplateID
ORDER BY ProcessTemplateStageFields.Sequence