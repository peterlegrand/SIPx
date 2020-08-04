CREATE PROCEDURE [dbo].[usp_PageSections] (@UserId nvarchar(450), @PageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSections.PageSectionID
	, ISNULL(UserPageSectionLanguage.Name,ISNULL(DefaultPageSectionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserPageSectionLanguage.Description,ISNULL(DefaultPageSectionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserPageSectionLanguage.MenuName,ISNULL(DefaultPageSectionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserPageSectionLanguage.MouseOver,ISNULL(DefaultPageSectionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UserPageSectionLanguage.TitleName,ISNULL(DefaultPageSectionLanguage.TitleName,'No title name for this section')) TitleName
	, ISNULL(UserPageSectionLanguage.TitleDescription,ISNULL(DefaultPageSectionLanguage.TitleDescription,'No title description for this section')) TitleDescription
	, ISNULL(UIPageSectionTypeNameCustom.Customization,UIPageSectionTypeName.Name) PageSectionTypeName
	, ISNULL(UIPageSectionDataTypeNameCustom.Customization,UIPageSectionDataTypeName.Name) PageSectionDataTypeName
	, PageSections.ShowSectionTitleName
	, PageSections.ShowSectionTitleDescription
	, PageSections.ShowContentTypeTitleName
	, PageSections.ShowContentTypeTitleDescription
	, SizeX
	, SizeY 
	, DashboardRow 
	, DashboardColumn 
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
LEFT JOIN (SELECT PageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageSectionLanguages WHERE LanguageId = @LanguageID) UserPageSectionLanguage
	ON UserPageSectionLanguage.PageSectionId = PageSections.PageSectionID
LEFT JOIN (SELECT PageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageSectionLanguages JOIN Settings ON PageSectionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionLanguage
	ON DefaultPageSectionLanguage.PageSectionId = PageSections.PageSectionID
JOIN PageSectionTypes
	ON PageSectionTypes.PageSectionTypeId = PageSections.PageSectionTypeID
JOIN UITermLanguages UIPageSectionTypeName
	ON UIPageSectionTypeName.UITermId = PageSectionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionTypeNameCustom
	ON UIPageSectionTypeNameCustom.UITermId = PageSectionTypes.NameTermID
JOIN PageSectionDataTypes
	ON PageSectionDataTypes.PageSectionDataTypeId = PageSections.PageSectionDataTypeID
JOIN UITermLanguages UIPageSectionDataTypeName
	ON UIPageSectionDataTypeName.UITermId = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionDataTypeNameCustom
	ON UIPageSectionDataTypeNameCustom.UITermId = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeId = PageSections.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = PageSections.ContentTypeID
JOIN SortBys
	ON SortBys.SortById = PageSections.SortByID
JOIN UITermLanguages UISortByName
	ON UISortByName.UITermId = SortBys.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISortByNameCustom
	ON UISortByNameCustom.UITermId = SortBys.NameTermID
JOIN Persons Creator
	ON Creator.UserId = PageSections.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSections.ModifierID
WHERE PageSections.PageId = @PageID
	AND UIPageSectionTypeName.LanguageId = @LanguageID
	AND UIPageSectionDataTypeName.LanguageId = @LanguageID
	AND UISortByName.LanguageId = @LanguageID
ORDER BY ISNULL(UserPageSectionLanguage.Name,ISNULL(DefaultPageSectionLanguage.Name,'No name for this section'))


