CREATE PROCEDURE usp_FrontClassificationValueDashboardContent (@CurrentUserId nvarchar(450), @ClassificationValueId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserId 
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelId
FROM AspNetUsers
WHERE Id = @CurrentUserId 
;


SELECT
	Contents.ContentID
	, Contents.Title
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
		, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName

FROM ContentClassificationValues
JOIN Contents
	ON ContentClassificationValues.ContentID = Contents.ContentID
JOIN ContentStatuses
	ON ContentStatuses.ContentStatusId = Contents.ContentStatusId
JOIN UITermLanguages StatusName
	ON ContentStatuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON ContentStatuses.NameTermId = UserStatusName.UITermId  

LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID= Contents.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = Contents.ContentTypeID
WHERE ContentClassificationValues.ClassificationValueID = @ClassificationValueId
	AND StatusName.LanguageId = @LanguageID
	AND Contents.SecurityLevelID <= @SecurityLevelId

END
