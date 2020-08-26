CREATE PROCEDURE usp_FrontContentShowContentClassificationValues (@UserId nvarchar(450), @ContentId int)
AS
DECLARE @LanguageId int;
DECLARE @SecurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT @SecurityLevelId = SecurityLevelID FROM AspNetUsers WHERE id = @UserId;
SELECT 
	Contents.ContentID
	, ContentClassificationValues.ClassificationValueID
	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this organization')) ClassificationValueName
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this organization')) ClassificationName

FROM Contents
JOIN ContentClassificationValues
	ON Contents.ContentID = ContentClassificationValues.ContentID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueID= ContentClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ContentClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID= ContentClassificationValues.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = ContentClassificationValues.ClassificationID
WHERE Contents.SecurityLevelID <= @SecurityLevelId
	AND Contents.ContentID = @ContentId