CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionUpdateGet] (@UserId nvarchar(450), @ClassificationPageSectionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationPageSections.ClassificationPageSectionID
	, ClassificationPageSections.ClassificationPageID
	, ClassificationPageSections.ClassificationID
	, ISNULL(UserClassificationPageSectionLanguage.ClassificationPageSectionLanguageID,ISNULL(DefaultClassificationPageSectionLanguage.ClassificationPageSectionLanguageID,0)) ClassificationPageSectionLanguageID
	, ISNULL(UserClassificationPageSectionLanguage.Name,ISNULL(DefaultClassificationPageSectionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserClassificationPageSectionLanguage.Description,ISNULL(DefaultClassificationPageSectionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserClassificationPageSectionLanguage.MenuName,ISNULL(DefaultClassificationPageSectionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserClassificationPageSectionLanguage.MouseOver,ISNULL(DefaultClassificationPageSectionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UserClassificationPageSectionLanguage.TitleName,ISNULL(DefaultClassificationPageSectionLanguage.TitleName,'No title name for this section')) TitleName
	, ISNULL(UserClassificationPageSectionLanguage.TitleDescription,ISNULL(DefaultClassificationPageSectionLanguage.TitleDescription,'No title description for this section')) TitleDescription
	, ClassificationPageSections.PageSectionTypeID
	, ClassificationPageSections.PageSectionDataTypeID
	, ISNULL(UIPageSectionTypeNameCustom.Customization,UIPageSectionTypeName.Name) PageSectionTypeName
	, ISNULL(UIPageSectionDataTypeNameCustom.Customization,UIPageSectionDataTypeName.Name) PageSectionDataTypeName
	, ClassificationPageSections.ShowSectionTitleName
	, ClassificationPageSections.ShowSectionTitleDescription
	, ClassificationPageSections.ShowContentTypeTitleName
	, ClassificationPageSections.ShowContentTypeTitleDescription
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
	, ClassificationPageSections.ContentTypeID
	, SizeX
	, SizeY
	, DashboardRow
	, DashboardColumn
	, ISNULL(UISortByNameCustom.Customization,UISortByName.Name) SortByName
	, ClassificationPageSections.SortByID
	, ClassificationPageSections.MaxContent
	, ClassificationPageSections.HasPaging
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationPageSections.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationPageSections.ModifiedDate
FROM ClassificationPageSections 
LEFT JOIN (SELECT ClassificationPageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription,ClassificationPageSectionLanguageID FROM ClassificationPageSectionLanguages WHERE LanguageId = @LanguageID) UserClassificationPageSectionLanguage
	ON UserClassificationPageSectionLanguage.ClassificationPageSectionId = ClassificationPageSections.ClassificationPageSectionID
LEFT JOIN (SELECT ClassificationPageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription,ClassificationPageSectionLanguageID FROM ClassificationPageSectionLanguages JOIN Settings ON ClassificationPageSectionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationPageSectionLanguage
	ON DefaultClassificationPageSectionLanguage.ClassificationPageSectionId = ClassificationPageSections.ClassificationPageSectionID
JOIN PageSectionTypes
	ON PageSectionTypes.PageSectionTypeId = ClassificationPageSections.PageSectionTypeID
JOIN UITermLanguages UIPageSectionTypeName
	ON UIPageSectionTypeName.UITermId = PageSectionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionTypeNameCustom
	ON UIPageSectionTypeNameCustom.UITermId = PageSectionTypes.NameTermID
JOIN PageSectionDataTypes
	ON PageSectionDataTypes.PageSectionDataTypeId = ClassificationPageSections.PageSectionDataTypeID
JOIN UITermLanguages UIPageSectionDataTypeName
	ON UIPageSectionDataTypeName.UITermId = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionDataTypeNameCustom
	ON UIPageSectionDataTypeNameCustom.UITermId = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeId = ClassificationPageSections.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = ClassificationPageSections.ContentTypeID
JOIN SortBys
	ON SortBys.SortById = ClassificationPageSections.SortByID
JOIN UITermLanguages UISortByName
	ON UISortByName.UITermId = SortBys.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISortByNameCustom
	ON UISortByNameCustom.UITermId = SortBys.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationPageSections.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationPageSections.ModifierID
WHERE ClassificationPageSections.ClassificationPageSectionId = @ClassificationPageSectionID
	AND UIPageSectionTypeName.LanguageId = @LanguageID
	AND UIPageSectionDataTypeName.LanguageId = @LanguageID
	AND UISortByName.LanguageId = @LanguageID


