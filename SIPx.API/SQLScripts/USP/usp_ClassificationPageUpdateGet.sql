CREATE PROCEDURE [dbo].[usp_ClassificationPageUpdateGet] (@UserId nvarchar(450), @ClassificationPageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationPages.ClassificationPageID
	, ClassificationPages.ClassificationID
	, ClassificationPages.StatusID
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
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationPages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationPages.ModifiedDate
FROM ClassificationPages 
LEFT JOIN (SELECT ClassificationPageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, ClassificationPageLanguageID FROM ClassificationPageLanguages WHERE LanguageId = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, ClassificationPageLanguageID FROM ClassificationPageLanguages JOIN Settings ON ClassificationPageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
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
	AND ClassificationPages.ClassificationPageId = @ClassificationPageID
