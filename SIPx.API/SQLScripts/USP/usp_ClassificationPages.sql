CREATE PROCEDURE [dbo].[usp_ClassificationPages] (@UserID nvarchar(450), @ClassificationID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationPages.ClassificationPageID
	, ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationPageLanguage.Description,ISNULL(DefaultClassificationPageLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationPageLanguage.MenuName,ISNULL(DefaultClassificationPageLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationPageLanguage.MouseOver,ISNULL(DefaultClassificationPageLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserClassificationPageLanguage.TitleName,ISNULL(DefaultClassificationPageLanguage.TitleName,'No title name for this role')) TitleName
	, ISNULL(UserClassificationPageLanguage.TitleDescription,ISNULL(DefaultClassificationPageLanguage.TitleDescription,'No title description for this role')) TitleDescription
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ClassificationPages.ShowTitleName
	, ClassificationPages.ShowTitleDescription
FROM ClassificationPages 
LEFT JOIN (SELECT ClassificationPageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM ClassificationPageLanguages WHERE LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM ClassificationPageLanguages JOIN Settings ON ClassificationPageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
JOIN Statuses 
	ON Statuses.StatusID = ClassificationPages.StatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermID = Statuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermID = Statuses.NameTermID
WHERE ClassificationPages.ClassificationID = @ClassificationID
	AND UIStatusName.LanguageID = @LanguageID
ORDER BY ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for this role'))