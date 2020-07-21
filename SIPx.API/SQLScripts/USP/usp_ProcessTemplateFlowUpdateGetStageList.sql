CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowUpdateGetStageList] (@UserId nvarchar(450), @ProcessTemplateStageFieldID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTemplateStageId int;
SELECT @ProcessTemplateStageId = ProcessTemplateStageId
FROM ProcessTemplateStageFields
WHERE ProcessTemplateStageFields.ProcessTemplateStageFieldID = @ProcessTemplateStageFieldID;

SELECT ProcessTemplateStageFields.Sequence
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this role')) Name
FROM ProcessTemplateStageFields 
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateStageFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateStageFields.ProcessTemplateFieldID
WHERE ProcessTemplateStageFields.ProcessTemplateStageID = @ProcessTemplateStageId
ORDER BY ProcessTemplateStageFields.Sequence