create PROCEDURE usp_PageSectionConditionUpdateGet (@UserId nvarchar(450), @PageSectionConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionConditions.PageSectionConditionID
, PageSectionConditions.PageSectionID
, PageSectionConditions.PageID
	, ISNULL(UserPageSectionConditionLanguage.Name,ISNULL(DefaultPageSectionConditionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserPageSectionConditionLanguage.Description,ISNULL(DefaultPageSectionConditionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserPageSectionConditionLanguage.MenuName,ISNULL(DefaultPageSectionConditionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserPageSectionConditionLanguage.MouseOver,ISNULL(DefaultPageSectionConditionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, PageSectionConditions.PageSectionConditionTypeID
	, PageSectionConditions.PageSectionConditionInt
	, PageSectionConditions.PageSectionConditionDate
	, PageSectionConditions.PageSectionConditionString
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PageSectionConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PageSectionConditions.ModifiedDate
FROM PageSectionConditions 
LEFT JOIN (SELECT PageSectionConditionId, Name, Description, MenuName, MouseOver FROM PageSectionConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionConditionLanguage
	ON UserPageSectionConditionLanguage.PageSectionConditionId = PageSectionConditions.PageSectionConditionID
LEFT JOIN (SELECT PageSectionConditionId, Name, Description, MenuName, MouseOver FROM PageSectionConditionLanguages JOIN Settings ON PageSectionConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionConditionLanguage
	ON DefaultPageSectionConditionLanguage.PageSectionConditionId = PageSectionConditions.PageSectionConditionID
JOIN Persons Creator
	ON Creator.UserId = PageSectionConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionConditions.ModifierID
WHERE PageSectionConditions.PageSectionConditionId = @PageSectionConditionId 
ORDER BY ISNULL(UserPageSectionConditionLanguage.Name,ISNULL(DefaultPageSectionConditionLanguage.Name,'No name for this section'))


