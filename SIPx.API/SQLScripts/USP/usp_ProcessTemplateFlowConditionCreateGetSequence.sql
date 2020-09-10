CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionCreateGetSequence] (@UserId nvarchar(450), @ProcessTemplateFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowConditions.Sequence
	, ISNULL(UserProcessTemplateFlowConditionLanguage.Name,ISNULL(DefaultProcessTemplateFlowConditionLanguage.Name,'No name for this level')) Name
FROM ProcessTemplateFlowConditions 
LEFT JOIN (SELECT ProcessTemplateFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFlowConditionLanguage
	ON UserProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionId = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
LEFT JOIN (SELECT ProcessTemplateFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages JOIN Settings ON ProcessTemplateFlowConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFlowConditionLanguage
	ON DefaultProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionId = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
WHERE ProcessTemplateFlowConditions.ProcessTemplateFlowID = @ProcessTemplateFlowId
ORDER BY  ISNULL(UserProcessTemplateFlowConditionLanguage.Name,ISNULL(DefaultProcessTemplateFlowConditionLanguage.Name,'No name for this level'))

