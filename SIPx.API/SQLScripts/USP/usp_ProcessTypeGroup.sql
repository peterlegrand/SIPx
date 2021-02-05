CREATE PROCEDURE [dbo].[usp_ProcessTypeGroup] (@UserId nvarchar(450), @ProcessTypeGroupId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeGroups.ProcessTypeGroupID
	, ISNULL(UserProcessTypeGroupLanguage.Name,ISNULL(DefaultProcessTypeGroupLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeGroupLanguage.Description,ISNULL(DefaultProcessTypeGroupLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeGroupLanguage.MenuName,ISNULL(DefaultProcessTypeGroupLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeGroupLanguage.MouseOver,ISNULL(DefaultProcessTypeGroupLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ProcessTypeGroups.Sequence
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeGroups.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTypeGroups.ModifiedDate
FROM ProcessTypeGroups 
LEFT JOIN (SELECT ProcessTypeGroupId, Name, Description, MenuName, MouseOver FROM ProcessTypeGroupLanguages WHERE LanguageId = @LanguageID) UserProcessTypeGroupLanguage
	ON UserProcessTypeGroupLanguage.ProcessTypeGroupId = ProcessTypeGroups.ProcessTypeGroupID
LEFT JOIN (SELECT ProcessTypeGroupId, Name, Description, MenuName, MouseOver FROM ProcessTypeGroupLanguages JOIN Settings ON ProcessTypeGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeGroupLanguage
	ON DefaultProcessTypeGroupLanguage.ProcessTypeGroupId = ProcessTypeGroups.ProcessTypeGroupID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeGroups.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeGroups.ModifierID
WHERE ProcessTypeGroups.ProcessTypeGroupId = @ProcessTypeGroupID
ORDER BY ProcessTypeGroups.Sequence
