CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionCreateGetFieldRoleList] (@UserId nvarchar(450), @ProcessTemplateFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTemplateId int;

SELECT @ProcessTemplateId = ProcessTemplateId FROM ProcessTemplateFlows WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId;
SELECT ProcessTemplateFields.ProcessTemplateFieldID
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this field')) Name
FROM ProcessTemplateFields 
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
WHERE ProcessTemplateFields.ProcessTemplateId = @ProcessTemplateID 
	AND ProcessTemplateFields.ProcessTemplateFieldTypeID IN (30,31, 34,35)
ORDER BY ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this field'))