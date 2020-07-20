CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateGroups.ProcessTemplateGroupID
	, ISNULL(UserProcessTemplateGroupLanguage.Name,ISNULL(DefaultProcessTemplateGroupLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateGroupLanguage.Description,ISNULL(DefaultProcessTemplateGroupLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateGroupLanguage.MenuName,ISNULL(DefaultProcessTemplateGroupLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateGroupLanguage.MouseOver,ISNULL(DefaultProcessTemplateGroupLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ProcessTemplateGroups.Sequence
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateGroups.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateGroups.ModifiedDate
FROM ProcessTemplateGroups 
LEFT JOIN (SELECT ProcessTemplateGroupId, Name, Description, MenuName, MouseOver FROM ProcessTemplateGroupLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateGroupLanguage
	ON UserProcessTemplateGroupLanguage.ProcessTemplateGroupId = ProcessTemplateGroups.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateGroupId, Name, Description, MenuName, MouseOver FROM ProcessTemplateGroupLanguages JOIN Settings ON ProcessTemplateGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateGroupLanguage
	ON DefaultProcessTemplateGroupLanguage.ProcessTemplateGroupId = ProcessTemplateGroups.ProcessTemplateGroupID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateGroups.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateGroups.ModifierID
ORDER BY ProcessTemplateGroups.Sequence
