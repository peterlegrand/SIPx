CREATE PROCEDURE usp_PageSectionContentConditionCreateGetClassifications (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Classifications.ClassificationID 
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this Classification')) Name
	, concat('V',Classifications.ClassificationID ) ControlA
	, concat('W',Classifications.ClassificationID ) ControlB
FROM Classifications
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID

ORDER BY ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this Classification'))

