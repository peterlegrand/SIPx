create PROCEDURE usp_PageSectionContentConditionUpdateGet (@UserId nvarchar(450), @PageSectionContentConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionContentConditions.PageSectionContentConditionID
, PageSectionContentConditions.PageSectionID
, PageSectionContentConditions.PageID
	, ISNULL(UserPageSectionContentConditionLanguage.Name,ISNULL(DefaultPageSectionContentConditionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserPageSectionContentConditionLanguage.Description,ISNULL(DefaultPageSectionContentConditionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserPageSectionContentConditionLanguage.MenuName,ISNULL(DefaultPageSectionContentConditionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserPageSectionContentConditionLanguage.MouseOver,ISNULL(DefaultPageSectionContentConditionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, PageSectionContentConditions.PageSectionContentConditionTypeID
	, PageSectionContentConditions.PageSectionContentConditionInt
	, PageSectionContentConditions.PageSectionContentConditionDate
	, PageSectionContentConditions.PageSectionContentConditionString
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PageSectionContentConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PageSectionContentConditions.ModifiedDate
FROM PageSectionContentConditions 
LEFT JOIN (SELECT PageSectionContentConditionId, Name, Description, MenuName, MouseOver FROM PageSectionContentConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionContentConditionLanguage
	ON UserPageSectionContentConditionLanguage.PageSectionContentConditionId = PageSectionContentConditions.PageSectionContentConditionID
LEFT JOIN (SELECT PageSectionContentConditionId, Name, Description, MenuName, MouseOver FROM PageSectionContentConditionLanguages JOIN Settings ON PageSectionContentConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionContentConditionLanguage
	ON DefaultPageSectionContentConditionLanguage.PageSectionContentConditionId = PageSectionContentConditions.PageSectionContentConditionID
JOIN Persons Creator
	ON Creator.UserId = PageSectionContentConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionContentConditions.ModifierID
WHERE PageSectionContentConditions.PageSectionContentConditionId = @PageSectionContentConditionId 
ORDER BY ISNULL(UserPageSectionContentConditionLanguage.Name,ISNULL(DefaultPageSectionContentConditionLanguage.Name,'No name for this section'))


