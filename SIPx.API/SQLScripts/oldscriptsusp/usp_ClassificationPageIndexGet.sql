CREATE PROCEDURE [dbo].[usp_ClassificationPageIndexGet] (@UserId nvarchar(450), @ClassificationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationPages.ClassificationPageID
	, ClassificationPages.ClassificationID
	, ClassificationPages.StatusID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UserClassificationPageLanguage.ClassificationPageLanguageID,ISNULL(DefaultClassificationPageLanguage.ClassificationPageLanguageID,0)) ClassificationPageLanguageID
	, ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationPageLanguage.Description,ISNULL(DefaultClassificationPageLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationPageLanguage.MenuName,ISNULL(DefaultClassificationPageLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationPageLanguage.MouseOver,ISNULL(DefaultClassificationPageLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserClassificationPageLanguage.TitleName,ISNULL(DefaultClassificationPageLanguage.TitleName,'No title name for this role')) TitleName
	, ISNULL(UserClassificationPageLanguage.TitleDescription,ISNULL(DefaultClassificationPageLanguage.TitleDescription,'No title description for this role')) TitleDescription
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ClassificationPages.ShowTitleName
	, ClassificationPages.ShowTitleDescription
	, @LanguageId LanguageId
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationPages.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationPages.ModifiedDate
FROM ClassificationPages 
LEFT JOIN (SELECT ClassificationPageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, ClassificationPageLanguageID FROM ClassificationPageLanguages WHERE LanguageId = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, ClassificationPageLanguageID FROM ClassificationPageLanguages JOIN Settings ON ClassificationPageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
JOIN Classifications
	ON ClassificationPages.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN Languages 
	ON Languages.LanguageId = @LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Statuses 
	ON Statuses.StatusId = ClassificationPages.StatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermId = Statuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationPages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationPages.ModifierID
WHERE UIStatusName.LanguageId = @LanguageID
	AND ClassificationPages.ClassificationId = @ClassificationID
ORDER BY ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for this role')) 