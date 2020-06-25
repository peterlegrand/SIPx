CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroup] (@UserID nvarchar(450), @ProcessTemplateGroupID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
LEFT JOIN (SELECT ProcessTemplateGroupID, Name, Description, MenuName, MouseOver FROM ProcessTemplateGroupLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateGroupLanguage
	ON UserProcessTemplateGroupLanguage.ProcessTemplateGroupID = ProcessTemplateGroups.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateGroupID, Name, Description, MenuName, MouseOver FROM ProcessTemplateGroupLanguages JOIN Settings ON ProcessTemplateGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateGroupLanguage
	ON DefaultProcessTemplateGroupLanguage.ProcessTemplateGroupID = ProcessTemplateGroups.ProcessTemplateGroupID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateGroups.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateGroups.ModifierID
WHERE ProcessTemplateGroups.ProcessTemplateGroupID = @ProcessTemplateGroupID
ORDER BY ProcessTemplateGroups.Sequence
