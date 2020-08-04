CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionIndexGet] (@UserId nvarchar(450), @ClassificationPageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationPageSections.ClassificationPageSectionID
	, ClassificationPageSections.ClassificationPageID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for this classification')) ClassificationPageName
	, ISNULL(UserClassificationPageSectionLanguage.Name,ISNULL(DefaultClassificationPageSectionLanguage.Name,'No name for this section')) Name
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, ClassificationPageSections.ClassificationID
	, ISNULL(UserClassificationPageSectionLanguage.ClassificationPageSectionLanguageID,ISNULL(DefaultClassificationPageSectionLanguage.ClassificationPageSectionLanguageID,0)) ClassificationPageSectionLanguageID
	, ISNULL(UserClassificationPageSectionLanguage.Description,ISNULL(DefaultClassificationPageSectionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserClassificationPageSectionLanguage.MenuName,ISNULL(DefaultClassificationPageSectionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserClassificationPageSectionLanguage.MouseOver,ISNULL(DefaultClassificationPageSectionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UserClassificationPageSectionLanguage.TitleName,ISNULL(DefaultClassificationPageSectionLanguage.TitleName,'No title name for this section')) TitleName
	, ISNULL(UserClassificationPageSectionLanguage.TitleDescription,ISNULL(DefaultClassificationPageSectionLanguage.TitleDescription,'No title description for this section')) TitleDescription
	, ISNULL(UIPageSectionTypeNameCustom.Customization,UIPageSectionTypeName.Name) PageSectionTypeName
	, ISNULL(UIPageSectionDataTypeNameCustom.Customization,UIPageSectionDataTypeName.Name) PageSectionDataTypeName
	, ClassificationPageSections.ShowSectionTitleName
	, ClassificationPageSections.ShowSectionTitleDescription
	, ClassificationPageSections.ShowContentTypeTitleName
	, ClassificationPageSections.ShowContentTypeTitleDescription
	, ClassificationPageSections.PageSectionTypeID
	, ClassificationPageSections.PageSectionDataTypeID
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
	, ISNULL(ClassificationPageSections.ContentTypeID,0) ContentTypeID
	, ISNULL(UISortByNameCustom.Customization,UISortByName.Name) SortByName
	, ClassificationPageSections.SortByID
	, ClassificationPageSections.MaxContent
	, ClassificationPageSections.HasPaging
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationPageSections.CreatorId
	, ClassificationPageSections.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationPageSections.ModifiedDate
	, ClassificationPageSections.ModifierId
FROM ClassificationPageSections 

LEFT JOIN (SELECT ClassificationPageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, ClassificationPageSectionLanguageID FROM ClassificationPageSectionLanguages WHERE LanguageId = @LanguageID) UserClassificationPageSectionLanguage
	ON UserClassificationPageSectionLanguage.ClassificationPageSectionId = ClassificationPageSections.ClassificationPageSectionID
LEFT JOIN (SELECT ClassificationPageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, ClassificationPageSectionLanguageID FROM ClassificationPageSectionLanguages JOIN Settings ON ClassificationPageSectionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationPageSectionLanguage
	ON DefaultClassificationPageSectionLanguage.ClassificationPageSectionId = ClassificationPageSections.ClassificationPageSectionID
JOIN Classifications
	ON ClassificationPageSections.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN ClassificationPages
	ON ClassificationPageSections.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageId, Name FROM ClassificationPageLanguages WHERE LanguageId = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageId, Name FROM ClassificationPageLanguages JOIN Settings ON ClassificationPageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
JOIN Languages 
	ON Languages.LanguageId = @LanguageId
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
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
WHERE ClassificationPageSections.ClassificationPageId = @ClassificationPageID
	AND UIPageSectionTypeName.LanguageId = @LanguageID
	AND UIPageSectionDataTypeName.LanguageId = @LanguageID
	AND UISortByName.LanguageId = @LanguageID
ORDER BY 	ISNULL(UserClassificationPageSectionLanguage.Name,ISNULL(DefaultClassificationPageSectionLanguage.Name,'No name for this section')) 


