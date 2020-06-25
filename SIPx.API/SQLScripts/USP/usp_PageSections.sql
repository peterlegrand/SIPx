CREATE PROCEDURE [dbo].[usp_PageSections] (@UserID nvarchar(450), @PageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT PageSections.PageSectionID
	, PageSections.PageID
	, ISNULL(UserPageSectionLanguage.Name,ISNULL(DefaultPageSectionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserPageSectionLanguage.Description,ISNULL(DefaultPageSectionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserPageSectionLanguage.MenuName,ISNULL(DefaultPageSectionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserPageSectionLanguage.MouseOver,ISNULL(DefaultPageSectionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UserPageSectionLanguage.TitleName,ISNULL(DefaultPageSectionLanguage.TitleName,'No title name for this section')) TitleName
	, ISNULL(UserPageSectionLanguage.TitleDescription,ISNULL(DefaultPageSectionLanguage.TitleDescription,'No title description for this section')) TitleDescription
	, ISNULL(UIPageSectionTypeNameCustom.Customization,UIPageSectionTypeName.Name) PageSectionTypeName
	, ISNULL(UIPageSectionDataTypeNameCustom.Customization,UIPageSectionDataTypeName.Name) PageSectionDataTypeName
	, PageSections.Sequence
	, PageSections.ShowSectionTitleName
	, PageSections.ShowSectionTitleDescription
	, PageSections.ShowContentTypeTitleName
	, PageSections.ShowContentTypeTitleDescription
	, PageSections.OneTwoColumns
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PageSections.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PageSections.ModifiedDate
FROM PageSections 
LEFT JOIN (SELECT PageSectionID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageSectionLanguages WHERE LanguageID = @LanguageID) UserPageSectionLanguage
	ON UserPageSectionLanguage.PageSectionID = PageSections.PageSectionID
LEFT JOIN (SELECT PageSectionID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageSectionLanguages JOIN Settings ON PageSectionLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultPageSectionLanguage
	ON DefaultPageSectionLanguage.PageSectionID = PageSections.PageSectionID
JOIN PageSectionTypes
	ON PageSectionTypes.PageSectionTypeID = PageSections.PageSectionTypeID
JOIN UITermLanguages UIPageSectionTypeName
	ON UIPageSectionTypeName.UITermID = PageSectionTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIPageSectionTypeNameCustom
	ON UIPageSectionTypeNameCustom.UITermID = PageSectionTypes.NameTermID
JOIN PageSectionDataTypes
	ON PageSectionDataTypes.PageSectionDataTypeID = PageSections.PageSectionDataTypeID
JOIN UITermLanguages UIPageSectionDataTypeName
	ON UIPageSectionDataTypeName.UITermID = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIPageSectionDataTypeNameCustom
	ON UIPageSectionDataTypeNameCustom.UITermID = PageSectionDataTypes.NameTermID
JOIN Persons Creator
	ON Creator.UserID = PageSections.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PageSections.ModifierID
WHERE PageSections.PageID = @PageID
	AND UIPageSectionTypeName.LanguageID = @LanguageID
	AND UIPageSectionDataTypeName.LanguageID = @LanguageID
ORDER BY PageSections.Sequence


