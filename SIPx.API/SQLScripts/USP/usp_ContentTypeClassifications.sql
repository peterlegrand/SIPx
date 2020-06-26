CREATE PROCEDURE [dbo].[usp_ContentTypeClassifications] (@UserID nvarchar(450), @ContentTypeID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ContentTypeClassifications.ContentTypeClassificationID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UINameCustom.Customization,UIName.Name) StatusName
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypeClassifications.ModifiedDate
FROM ContentTypeClassifications
LEFT JOIN (SELECT ClassificationID, Name FROM ClassificationLanguages WHERE LanguageID = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID = ContentTypeClassifications.ClassificationID
LEFT JOIN (SELECT ClassificationID, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationID = ContentTypeClassifications.ClassificationID
JOIN ContentTypeClassificationStatuses
	ON ContentTypeClassifications.ContentTypeClassificationStatusID = ContentTypeClassificationStatuses.ContentTypeClassificationStatusID
JOIN UITermLanguages UIName
	ON UIName.UITermID = ContentTypeClassificationStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = ContentTypeClassificationStatuses.NameTermID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypeClassifications.ModifierID
WHERE ContentTypeClassifications.ContentTypeID = @ContentTypeID
	AND UIName.LanguageID = @LanguageID
ORDER BY ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification'))  