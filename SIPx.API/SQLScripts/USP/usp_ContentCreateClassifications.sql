CREATE PROCEDURE [dbo].[usp_ContentCreateClassifications] (@UserId nvarchar(450), @ContentTypeId int) 
AS 
DECLARE @LanguageId int;

DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;

SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT
	ContentTypeClassifications.ClassificationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
FROM ContentTypeClassifications
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= ContentTypeClassifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = ContentTypeClassifications.ClassificationID
WHERE ContentTypeClassifications.ContentTypeId = @ContentTypeID
	AND ContentTypeClassifications.ContentTypeClassificationStatusId <> 1
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification'))

