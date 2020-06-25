CREATE PROCEDURE [dbo].[usp_ClassificationPageSection] (@UserID nvarchar(450), @ClassificationPageSectionID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationPageSections.ClassificationPageSectionID
	, ClassificationPageSections.ClassificationPageID
	, ClassificationPageSections.ClassificationID
	, ISNULL(UserClassificationPageSectionLanguage.Name,ISNULL(DefaultClassificationPageSectionLanguage.Name,'No name for this section')) Name
	, ISNULL(UserClassificationPageSectionLanguage.Description,ISNULL(DefaultClassificationPageSectionLanguage.Description,'No description for this section')) Description
	, ISNULL(UserClassificationPageSectionLanguage.MenuName,ISNULL(DefaultClassificationPageSectionLanguage.MenuName,'No menu name for this section')) MenuName
	, ISNULL(UserClassificationPageSectionLanguage.MouseOver,ISNULL(DefaultClassificationPageSectionLanguage.MouseOver,'No mouse over for this section')) MouseOver
	, ISNULL(UserClassificationPageSectionLanguage.TitleName,ISNULL(DefaultClassificationPageSectionLanguage.TitleName,'No title name for this section')) TitleName
	, ISNULL(UserClassificationPageSectionLanguage.TitleDescription,ISNULL(DefaultClassificationPageSectionLanguage.TitleDescription,'No title description for this section')) TitleDescription
	, ISNULL(UIPageSectionTypeNameCustom.Customization,UIPageSectionTypeName.Name) PageSectionTypeName
	, ISNULL(UIPageSectionDataTypeNameCustom.Customization,UIPageSectionDataTypeName.Name) PageSectionDataTypeName
	, ClassificationPageSections.Sequence
	, ClassificationPageSections.ShowSectionTitleName
	, ClassificationPageSections.ShowSectionTitleDescription
	, ClassificationPageSections.ShowContentTypeTitleName
	, ClassificationPageSections.ShowContentTypeTitleDescription
	, ClassificationPageSections.OneTwoColumns
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationPageSections.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationPageSections.ModifiedDate
FROM ClassificationPageSections 
LEFT JOIN (SELECT ClassificationPageSectionID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM ClassificationPageSectionLanguages WHERE LanguageID = @LanguageID) UserClassificationPageSectionLanguage
	ON UserClassificationPageSectionLanguage.ClassificationPageSectionID = ClassificationPageSections.ClassificationPageSectionID
LEFT JOIN (SELECT ClassificationPageSectionID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM ClassificationPageSectionLanguages JOIN Settings ON ClassificationPageSectionLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationPageSectionLanguage
	ON DefaultClassificationPageSectionLanguage.ClassificationPageSectionID = ClassificationPageSections.ClassificationPageSectionID
JOIN PageSectionTypes
	ON PageSectionTypes.PageSectionTypeID = ClassificationPageSections.PageSectionTypeID
JOIN UITermLanguages UIPageSectionTypeName
	ON UIPageSectionTypeName.UITermID = PageSectionTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIPageSectionTypeNameCustom
	ON UIPageSectionTypeNameCustom.UITermID = PageSectionTypes.NameTermID
JOIN PageSectionDataTypes
	ON PageSectionDataTypes.PageSectionDataTypeID = ClassificationPageSections.PageSectionDataTypeID
JOIN UITermLanguages UIPageSectionDataTypeName
	ON UIPageSectionDataTypeName.UITermID = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIPageSectionDataTypeNameCustom
	ON UIPageSectionDataTypeNameCustom.UITermID = PageSectionDataTypes.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ClassificationPageSections.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationPageSections.ModifierID
WHERE ClassificationPageSections.ClassificationPageSectionID = @ClassificationPageSectionID
	AND UIPageSectionTypeName.LanguageID = @LanguageID
	AND UIPageSectionDataTypeName.LanguageID = @LanguageID


