CREATE PROCEDURE [dbo].[usp_Classifications] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Classifications.ClassificationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this classification')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this classification')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this classification')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, CASE WHEN Classifications.DefaultPageID IS NULL THEN ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for the default page')) ELSE 'There is no default page' END DefaultPage
	, Classifications.HasDropDown 
	, Classifications.DropDownSequence
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Classifications.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Classifications.ModifiedDate
FROM Classifications 
JOIN Statuses 
	ON Statuses.StatusID = Classifications.StatusID
JOIN UITermLanguages UIName
	ON UIName.UITermID = Statuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = Statuses.NameTermID
LEFT JOIN (SELECT ClassificationID, Name, Description, MenuName, MouseOver FROM ClassificationLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationPageID, Name FROM ClassificationPageLanguages WHERE LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = Classifications.DefaultPageID
LEFT JOIN (SELECT ClassificationPageID, Name FROM ClassificationPageLanguages  JOIN Settings ON ClassificationPageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = Classifications.DefaultPageID
JOIN Persons Creator
	ON Creator.UserID = Classifications.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = Classifications.ModifierID
WHERE UIName.LanguageID = @LanguageID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) 


