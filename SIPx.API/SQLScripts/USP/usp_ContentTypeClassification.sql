CREATE PROCEDURE [dbo].[usp_ContentTypeClassification] (@UserId nvarchar(450), @ContentTypeClassificationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypeClassifications.ContentTypeClassificationID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UINameCustom.Customization,UIName.Name) StatusName
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypeClassifications.ModifiedDate
FROM ContentTypeClassifications
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = ContentTypeClassifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = ContentTypeClassifications.ClassificationID
JOIN ContentTypeClassificationStatuses
	ON ContentTypeClassifications.ContentTypeClassificationStatusId = ContentTypeClassificationStatuses.ContentTypeClassificationStatusID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ContentTypeClassificationStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ContentTypeClassificationStatuses.NameTermID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeClassifications.ModifierID
WHERE ContentTypeClassifications.ContentTypeClassificationId = @ContentTypeClassificationID
