CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowUpdateGetStageList] (@UserId nvarchar(450), @ProcessTemplateFlowID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTemplateId int;
SELECT @ProcessTemplateId = ProcessTemplateId
FROM ProcessTemplateFlows
WHERE ProcessTemplateFlows.ProcessTemplateFlowID = @ProcessTemplateFlowID;

SELECT ProcessTemplateStages.ProcessTemplateStageID
	, ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No name for this stage')) Name
FROM ProcessTemplateStages 
LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageLanguage
	ON UserProcessTemplateStageLanguage.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageId, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageLanguage
	ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageID
WHERE ProcessTemplateStages.ProcessTemplateID = @ProcessTemplateId
ORDER BY ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No name for this stage'))