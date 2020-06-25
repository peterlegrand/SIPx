CREATE PROCEDURE [dbo].[usp_PageSection] (@UserID nvarchar(450), @PageSectionID  int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT PageSections.PageSectionID
	, ISNULL(UserPageSectionLanguage.Name,ISNULL(DefaultPageSectionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserPageSectionLanguage.Description,ISNULL(DefaultPageSectionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserPageSectionLanguage.MenuName,ISNULL(DefaultPageSectionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserPageSectionLanguage.MouseOver,ISNULL(DefaultPageSectionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UserPageSectionLanguage.TitleName,ISNULL(DefaultPageSectionLanguage.TitleName,'No title name for this section')) TitleName
	, ISNULL(UserPageSectionLanguage.TitleDescription,ISNULL(DefaultPageSectionLanguage.TitleDescription,'No title description for this section')) TitleDescription
	, PageSections.Sequence
	, ISNULL(UIPageSectionTypeNameCustom.Customization,UIPageSectionTypeName.Name) PageSectionTypeName
	, ISNULL(UIPageSectionDataTypeNameCustom.Customization,UIPageSectionDataTypeName.Name) PageSectionDataTypeName
	, PageSections.ShowSectionTitleName
	, PageSections.ShowSectionTitleDescription
	, PageSections.ShowContentTypeTitleName
	, PageSections.ShowContentTypeTitleDescription
	, PageSections.OneTwoColumns
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
	, PageSections.ContentTypeID
	, ISNULL(UISortByNameCustom.Customization,UISortByName.Name) SortByName
	, PageSections.SortByID
	, PageSections.MaxContent
	, PageSections.HasPaging
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
LEFT JOIN (SELECT ContentTypeID, Name FROM ContentTypeLanguages WHERE LanguageID = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID = PageSections.ContentTypeID
LEFT JOIN (SELECT ContentTypeID, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeID = PageSections.ContentTypeID
JOIN SortBys
	ON SortBys.SortByID = PageSections.SortByID
JOIN UITermLanguages UISortByName
	ON UISortByName.UITermID = SortBys.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISortByNameCustom
	ON UISortByNameCustom.UITermID = SortBys.NameTermID
JOIN Persons Creator
	ON Creator.UserID = PageSections.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PageSections.ModifierID
WHERE PageSections.PageSectionID = @PageSectionID 
	AND UIPageSectionTypeName.LanguageID = @LanguageID
	AND UIPageSectionDataTypeName.LanguageID = @LanguageID
	AND UISortByName.LanguageID = @LanguageID
ORDER BY PageSections.Sequence


