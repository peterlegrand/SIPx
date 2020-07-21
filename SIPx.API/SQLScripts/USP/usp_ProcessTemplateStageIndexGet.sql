CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageIndexGet] (@UserId nvarchar(450), @ProcessTemplateId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateStages.ProcessTemplateStageID
	, ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No name for this stage')) Name
	, ISNULL(UserProcessTemplateStageLanguage.Description,ISNULL(DefaultProcessTemplateStageLanguage.Description,'No description for this stage')) Description
	, ISNULL(UserProcessTemplateStageLanguage.MenuName,ISNULL(DefaultProcessTemplateStageLanguage.MenuName,'No menu name for this stage')) MenuName
	, ISNULL(UserProcessTemplateStageLanguage.MouseOver,ISNULL(DefaultProcessTemplateStageLanguage.MouseOver,'No mouse over for this stage')) MouseOver
	, ISNULL(UserProcessTemplateStageTypeLanguage.Name,ISNULL(DefaultProcessTemplateStageTypeLanguage.Name,'No name for this stage type')) TypeName
	, ProcessTemplateStages.IsEndStage
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateStages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStages.ModifiedDate
FROM ProcessTemplateStages 
LEFT JOIN (SELECT ProcessTemplateStageId, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageLanguage
	ON UserProcessTemplateStageLanguage.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageId, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageLanguage
	ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageTypeLanguage
	ON UserProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStages.ProcessTemplateStageTypeID
LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageTypeLanguage
	ON DefaultProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStages.ProcessTemplateStageTypeID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateStages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateStages.ModifierID
WHERE ProcessTemplateStages.ProcessTemplateId = @ProcessTemplateID
ORDER BY ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No name for this stage'))


