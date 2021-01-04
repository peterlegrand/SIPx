CREATE PROCEDURE usp_FrontClassificationValueDashboard (@CurrentUserId nvarchar(450), @ClassificationValueId int) 
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

SELECT Classifications.ClassificationID
	, ClassificationValues.ClassificationValueID
	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this classification value')) ClassificationValueName
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UserClassificationValueLanguage.Description ,ISNULL(UserClassificationValueLanguage.Description,'No description for this classification vakye')) ClassificationValueDescription

FROM ClassificationValues
JOIN Classifications
	ON Classifications.ClassificationID = ClassificationValues.ClassificationID
LEFT JOIN (SELECT ClassificationValueId, Name, Description FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueID= ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID

	LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID

LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID= Classifications.ClassificationID
WHERE @ClassificationValueId = ClassificationValues.ClassificationValueID
END;