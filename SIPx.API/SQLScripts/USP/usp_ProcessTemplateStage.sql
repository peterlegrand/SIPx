CREATE PROCEDURE [dbo].[usp_ProcessTemplateStage] (@UserID nvarchar(450), @ProcessTemplateStageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
LEFT JOIN (SELECT ProcessTemplateStageID, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateStageLanguage
	ON UserProcessTemplateStageLanguage.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageID, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateStageLanguage
	ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageTypeID, Name FROM ProcessTemplateStageTypeLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateStageTypeLanguage
	ON UserProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeID = ProcessTemplateStages.ProcessTemplateStageTypeID
LEFT JOIN (SELECT ProcessTemplateStageTypeID, Name FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateStageTypeLanguage
	ON DefaultProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeID = ProcessTemplateStages.ProcessTemplateStageTypeID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateStages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStages.ModifierID
WHERE ProcessTemplateStages.ProcessTemplateStageID = @ProcessTemplateStageID


