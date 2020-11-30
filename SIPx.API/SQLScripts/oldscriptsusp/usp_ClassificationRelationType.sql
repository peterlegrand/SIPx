CREATE PROCEDURE [dbo].[usp_ClassificationRelationType] (@UserId nvarchar(450), @ClassificationRelationTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
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
LEFT JOIN (SELECT ClassificationRelationTypeId, Name, Description, MenuName, MouseOver FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationRelationTypes.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name, Description, MenuName, MouseOver FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationRelationTypes.ClassificationRelationTypeID
JOIN Persons Creator
	ON Creator.UserId = ClassificationRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationRelationTypes.ModifierID
WHERE ClassificationRelationTypes.ClassificationRelationTypeId = @ClassificationRelationTypeID


