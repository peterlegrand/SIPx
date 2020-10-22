CREATE PROCEDURE usp_ProcessTemplateFlowPassCreateGetSequence (@UserId nvarchar(450), @ProcessTemplateFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowPasses.Sequence
	, ISNULL(UserProcessTemplateFlowPassLanguage.Name,ISNULL(DefaultProcessTemplateFlowPassLanguage.Name,'No name for this level')) Name
FROM ProcessTemplateFlowPasses 
LEFT JOIN (SELECT ProcessTemplateFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowPassLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFlowPassLanguage
	ON UserProcessTemplateFlowPassLanguage.ProcessTemplateFlowPassId = ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
LEFT JOIN (SELECT ProcessTemplateFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowPassLanguages JOIN Settings ON ProcessTemplateFlowPassLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFlowPassLanguage
	ON DefaultProcessTemplateFlowPassLanguage.ProcessTemplateFlowPassId = ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
WHERE ProcessTemplateFlowPasses.ProcessTemplateFlowID = @ProcessTemplateFlowId
ORDER BY  ISNULL(UserProcessTemplateFlowPassLanguage.Name,ISNULL(DefaultProcessTemplateFlowPassLanguage.Name,'No name for this level'))

