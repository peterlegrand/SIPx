CREATE PROCEDURE usp_ClassificationValueListPerClassification (@UserId nvarchar(450), @ClassificationId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValues.ClassificationValueID 
	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this ClassificationValue')) Name
FROM ClassificationValues
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
WHERE ClassificationValues.ClassificationID = @ClassificationId
ORDER BY ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this ClassificationValue'))


