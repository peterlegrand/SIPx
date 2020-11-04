CREATE PROCEDURE usp_PageSectionProcessConditionDeleteGet (@UserId nvarchar(450), @PageSectionProcessConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionProcessConditions.PageSectionProcessConditionID
	, ISNULL(UserPageSectionProcessConditionLanguage.Name,ISNULL(DefaultPageSectionProcessConditionLanguage.Name,'No name for this SectionProcessCondition')) Name
	, ISNULL(UserPageSectionProcessConditionLanguage.Description,ISNULL(DefaultPageSectionProcessConditionLanguage.Description,'No description for this SectionProcessCondition')) Description
	, ISNULL(UserPageSectionProcessConditionLanguage.MenuName,ISNULL(DefaultPageSectionProcessConditionLanguage.MenuName,'No menu name for this SectionProcessCondition')) MenuName
	, ISNULL(UserPageSectionProcessConditionLanguage.MouseOver,ISNULL(DefaultPageSectionProcessConditionLanguage.MouseOver,'No mouse over for this SectionProcessCondition')) MouseOver
	, ISNULL(UIPageSectionProcessConditionTypeNameCustom.Customization,UIPageSectionProcessConditionTypeName.Name) PageSectionProcessConditionTypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Creator.PersonID CreatorId
	, PageSectionProcessConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Modifier.PersonID ModifierId
	, PageSectionProcessConditions.ModifiedDate
FROM PageSectionProcessConditions 
LEFT JOIN (SELECT PageSectionProcessConditionId, Name, Description, MenuName, MouseOver FROM PageSectionProcessConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionProcessConditionLanguage
	ON UserPageSectionProcessConditionLanguage.PageSectionProcessConditionId = PageSectionProcessConditions.PageSectionProcessConditionID
LEFT JOIN (SELECT PageSectionProcessConditionId, Name, Description, MenuName, MouseOver FROM PageSectionProcessConditionLanguages JOIN Settings ON PageSectionProcessConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionProcessConditionLanguage
	ON DefaultPageSectionProcessConditionLanguage.PageSectionProcessConditionId = PageSectionProcessConditions.PageSectionProcessConditionID
JOIN PageSectionProcessConditionTypes
	ON PageSectionProcessConditionTypes.PageSectionProcessConditionTypeId = PageSectionProcessConditions.PageSectionProcessConditionTypeID
JOIN UITermLanguages UIPageSectionProcessConditionTypeName
	ON UIPageSectionProcessConditionTypeName.UITermId = PageSectionProcessConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionProcessConditionTypeNameCustom
	ON UIPageSectionProcessConditionTypeNameCustom.UITermId = PageSectionProcessConditionTypes.NameTermID




JOIN Persons Creator
	ON Creator.UserId = PageSectionProcessConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionProcessConditions.ModifierID
WHERE PageSectionProcessConditions.PageSectionProcessConditionId = @PageSectionProcessConditionId
	AND UIPageSectionProcessConditionTypeName.LanguageId = @LanguageID



