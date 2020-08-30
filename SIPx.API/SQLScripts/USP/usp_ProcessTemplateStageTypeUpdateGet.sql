CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeUpdateGet] (@UserId nvarchar(450), @ProcessTemplateStageTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateStageTypes.ProcessTemplateStageTypeID
	, ISNULL(UserProcessTemplateStageTypeLanguage.Name,ISNULL(DefaultProcessTemplateStageTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateStageTypeLanguage.Description,ISNULL(DefaultProcessTemplateStageTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateStageTypeLanguage.MenuName,ISNULL(DefaultProcessTemplateStageTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateStageTypeLanguage.MouseOver,ISNULL(DefaultProcessTemplateStageTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, IconID
	, Color
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateStageTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
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
WHERE ProcessTemplateStageTypes.ProcessTemplateStageTypeId = @ProcessTemplateStageTypeID
