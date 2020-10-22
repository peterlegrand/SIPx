CREATE PROCEDURE usp_ProcessTemplateFlowPassUpdateGetFieldList (@UserId nvarchar(450), @ProcessTemplateFlowPassId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTemplateId int;
SELECT @ProcessTemplateId = ProcessTemplateId FROM ProcessTemplateFlowPasses WHERE ProcessTemplateFlowPassId= @ProcessTemplateFlowPassId

SELECT ProcessTemplateFields.ProcessTemplateFieldID
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this field')) Name
FROM ProcessTemplateFields 
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
WHERE ProcessTemplateFields.ProcessTemplateId = @ProcessTemplateID
ORDER BY ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this field'))