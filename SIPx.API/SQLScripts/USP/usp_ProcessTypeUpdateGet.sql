CREATE PROCEDURE [dbo].[usp_ProcessTypeUpdateGet] (@UserId nvarchar(450), @ProcessTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypes.ProcessTypeID
	, ProcessTypes.CodePrefix
	, ProcessTypes.CodeSuffix
	, ProcessTypes.CodeTypeId
	, ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this ')) Name
	, ISNULL(UserProcessTypeLanguage.Description,ISNULL(DefaultProcessTypeLanguage.Description,'No description for this ')) Description
	, ISNULL(UserProcessTypeLanguage.MenuName,ISNULL(DefaultProcessTypeLanguage.MenuName,'No menu name for this ')) MenuName
	, ISNULL(UserProcessTypeLanguage.MouseOver,ISNULL(DefaultProcessTypeLanguage.MouseOver,'No mouse over for this ')) MouseOver
	, ISNULL(UserProcessTypeGroupLanguage.Name,ISNULL(DefaultProcessTypeGroupLanguage.Name,'No name for this  type')) GroupName
	, ProcessTypes.ShowInPersonalCalendar
	, ProcessTypes.ShowInProjectCalendar
	, ProcessTypes.ShowInOrganizationCalendar
	, ProcessTypes.ShowInEventCalendar
	, ProcessTypes.ProcessTypeGroupID
	, ObjectTypeStatusId 
	, ProcessTypes.IconID
	, ProcessTypes.Color
	, ProcessTypes.ProcessMultiMax
	, ProcessTypes.Sequence
	, ProcessTypes.IsPersonal
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypes.ModifiedDate
FROM ProcessTypes 
JOIN ProcessTypeGroups
	ON ProcessTypes.ProcessTypeGroupId =  ProcessTypeGroups.ProcessTypeGroupID
LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeLanguage
	ON UserProcessTypeLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeLanguage
	ON DefaultProcessTypeLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeGroupId, Name FROM ProcessTypeGroupLanguages WHERE LanguageId = @LanguageID) UserProcessTypeGroupLanguage
	ON UserProcessTypeGroupLanguage.ProcessTypeGroupId = ProcessTypes.ProcessTypeGroupID
LEFT JOIN (SELECT ProcessTypeGroupId, Name  FROM ProcessTypeGroupLanguages JOIN Settings ON ProcessTypeGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeGroupLanguage
	ON DefaultProcessTypeGroupLanguage.ProcessTypeGroupId = ProcessTypes.ProcessTypeGroupID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypes.ModifierID
WHERE ProcessTypes.ProcessTypeId = @ProcessTypeID
