CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationRelationTypes.ClassificationRelationTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) Name
FROM ClassificationRelationTypes 
LEFT JOIN (SELECT ClassificationRelationTypeId, Name, Description, MenuName, MouseOver FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationRelationTypeID= ClassificationRelationTypes.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name, Description, MenuName, MouseOver FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationRelationTypeId = ClassificationRelationTypes.ClassificationRelationTypeID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Classification relation type')) 
