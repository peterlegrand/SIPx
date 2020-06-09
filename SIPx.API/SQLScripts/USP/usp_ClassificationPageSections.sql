CREATE PROCEDURE [dbo].[usp_ClassificationPageSections] (@UserID nvarchar(450), @ClassificationPageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationPageSections.ClassificationPageSectionID
	, ISNULL(UserClassificationPageSectionLanguage.Name,ISNULL(DefaultClassificationPageSectionLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationPageSectionLanguage.Description,ISNULL(DefaultClassificationPageSectionLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationPageSectionLanguage.MenuName,ISNULL(DefaultClassificationPageSectionLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationPageSectionLanguage.MouseOver,ISNULL(DefaultClassificationPageSectionLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserClassificationPageSectionLanguage.TitleName,ISNULL(DefaultClassificationPageSectionLanguage.TitleName,'No title name for this role')) TitleName
	, ISNULL(UserClassificationPageSectionLanguage.TitleDescription,ISNULL(DefaultClassificationPageSectionLanguage.TitleDescription,'No title description for this role')) TitleDescription
	, ISNULL(UIPageSectionTypeNameCustom.Customization,UIPageSectionTypeName.Name) PageSectionTypeName
	, ISNULL(UIPageSectionDataTypeNameCustom.Customization,UIPageSectionDataTypeName.Name) PageSectionDataTypeName
	, ClassificationPageSections.Sequence
	, ClassificationPageSections.ShowSectionTitleName
	, ClassificationPageSections.ShowSectionTitleDescription
	, ClassificationPageSections.ShowContentTypeTitleName
	, ClassificationPageSections.ShowContentTypeTitleDescription
	, ClassificationPageSections.OneTwoColumns
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
WHERE ClassificationPageSections.ClassificationPageID = @ClassificationPageID
ORDER BY ClassificationPageSections.Sequence
