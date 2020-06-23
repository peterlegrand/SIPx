CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypes] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationRelationTypes.ClassificationRelationTypeID
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationRelationTypeLanguage.Description,ISNULL(DefaultClassificationRelationTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationRelationTypeLanguage.MenuName,ISNULL(DefaultClassificationRelationTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationRelationTypeLanguage.MouseOver,ISNULL(DefaultClassificationRelationTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationRelationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationRelationTypes.ModifiedDate
FROM ClassificationRelationTypes 
LEFT JOIN (SELECT ClassificationRelationTypeID, Name, Description, MenuName, MouseOver FROM ClassificationRelationTypeLanguages WHERE LanguageID = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationRelationTypes.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name, Description, MenuName, MouseOver FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationRelationTypes.ClassificationRelationTypeID
JOIN Persons Creator
	ON Creator.UserID = ClassificationRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationRelationTypes.ModifierID
ORDER BY ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this role'))


