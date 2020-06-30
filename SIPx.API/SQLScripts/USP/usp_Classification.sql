CREATE PROCEDURE [dbo].[usp_Classification] (@UserId nvarchar(450), @ClassificationId int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Classifications.ClassificationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this classification')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this classification')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this classification')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, CASE WHEN Classifications.DefaultPageId IS NOT NULL THEN ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for the default page')) ELSE 'There is no default page' END MouseOverName
	, Classifications.DefaultPageID
	, Classifications.HasDropDown 
	, Classifications.DropDownSequence
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Classifications.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Classifications.ModifiedDate
FROM Classifications 
JOIN Statuses 
	ON Statuses.StatusId = Classifications.StatusID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationPageId, Name FROM ClassificationPageLanguages WHERE LanguageId = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageId = Classifications.DefaultPageID
LEFT JOIN (SELECT ClassificationPageId, Name FROM ClassificationPageLanguages  JOIN Settings ON ClassificationPageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageId = Classifications.DefaultPageID
JOIN Persons Creator
	ON Creator.UserId = Classifications.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Classifications.ModifierID
WHERE UIName.LanguageId = @LanguageID
	AND Classifications.ClassificationId = @ClassificationID;

END;