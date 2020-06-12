CREATE PROCEDURE [dbo].[usp_ContentCreateClassifications] (@UserID nvarchar(450), @ContentTypeID int) 
AS 
DECLARE @LanguageID int;

DECLARE @SecurityLevelID int;
SELECT @SecurityLevelID = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;

SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT
	ContentTypeClassifications.ClassificationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
FROM ContentTypeClassifications
LEFT JOIN (SELECT ClassificationID, Name FROM ClassificationLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= ContentTypeClassifications.ClassificationID
LEFT JOIN (SELECT ClassificationID, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationID = ContentTypeClassifications.ClassificationID
WHERE ContentTypeClassifications.ContentTypeID = @ContentTypeID
	AND ContentTypeClassifications.ContentTypeClassificationStatusID <> 1
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification'))

