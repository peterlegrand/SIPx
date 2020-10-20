CREATE PROCEDURE usp_ClassificationValueRoleCreateGetClassificationName (@UserId nvarchar(450), @ClassificationValueId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationValues.ClassificationID 
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Role')) ClassificationValueName

FROM ClassificationValues
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValueID= ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
WHERE ClassificationValues.ClassificationValueID = @ClassificationValueId
