CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageFieldUpdateGetSequence] (@UserId nvarchar(450), @ProcessTemplateStageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTemplateID int;
SELECT @ProcessTemplateID = ProcessTemplateID FROM ProcessTemplateStages WHERE ProcessTemplateStageId = @ProcessTemplateStageId ; 
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
	AND ProcessTemplateStageFields.ProcessTemplateStageId = @ProcessTemplateStageId
ORDER BY ProcessTemplateStageFields.Sequence