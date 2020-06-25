CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypes] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ProcessTemplateStageTypes.ProcessTemplateStageTypeID
	, ISNULL(UserProcessTemplateStageTypeLanguage.Name,ISNULL(DefaultProcessTemplateStageTypeLanguage.Name,'No name for this relation type')) Name
	, ISNULL(UserProcessTemplateStageTypeLanguage.Description,ISNULL(DefaultProcessTemplateStageTypeLanguage.Description,'No description for this relation type')) Description
	, ISNULL(UserProcessTemplateStageTypeLanguage.MenuName,ISNULL(DefaultProcessTemplateStageTypeLanguage.MenuName,'No menu name for this relation type')) MenuName
	, ISNULL(UserProcessTemplateStageTypeLanguage.MouseOver,ISNULL(DefaultProcessTemplateStageTypeLanguage.MouseOver,'No mouse over for this relation type')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateStageTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStageTypes.ModifiedDate
FROM ProcessTemplateStageTypes 
LEFT JOIN (SELECT ProcessTemplateStageTypeID, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageTypeLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateStageTypeLanguage
	ON UserProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeID = ProcessTemplateStageTypes.ProcessTemplateStageTypeID
LEFT JOIN (SELECT ProcessTemplateStageTypeID, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateStageTypeLanguage
	ON DefaultProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeID = ProcessTemplateStageTypes.ProcessTemplateStageTypeID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateStageTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStageTypes.ModifierID
ORDER BY ISNULL(UserProcessTemplateStageTypeLanguage.Name,ISNULL(DefaultProcessTemplateStageTypeLanguage.Name,'No name for this relation type'))