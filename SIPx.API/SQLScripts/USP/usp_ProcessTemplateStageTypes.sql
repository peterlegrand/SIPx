CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypes] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
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
LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageTypeLanguage
	ON UserProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStageTypes.ProcessTemplateStageTypeID
LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name, Description, MenuName, MouseOver FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageTypeLanguage
	ON DefaultProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStageTypes.ProcessTemplateStageTypeID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateStageTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateStageTypes.ModifierID
ORDER BY ISNULL(UserProcessTemplateStageTypeLanguage.Name,ISNULL(DefaultProcessTemplateStageTypeLanguage.Name,'No name for this relation type'))