CREATE PROCEDURE [dbo].[usp_PersonRelationTypeIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PersonRelationTypes.PersonRelationTypeID
	, ISNULL(UserPersonRelationTypeLanguage.Name,ISNULL(DefaultPersonRelationTypeLanguage.Name,'No name for this relation type')) Name
	, ISNULL(UserPersonRelationTypeLanguage.Description,ISNULL(DefaultPersonRelationTypeLanguage.Description,'No description for this relation type')) Description
	, ISNULL(UserPersonRelationTypeLanguage.MenuName,ISNULL(DefaultPersonRelationTypeLanguage.MenuName,'No menu name for this relation type')) MenuName
	, ISNULL(UserPersonRelationTypeLanguage.MouseOver,ISNULL(DefaultPersonRelationTypeLanguage.MouseOver,'No mouse over for this relation type')) MouseOver
	, ISNULL(UserPersonRelationTypeLanguage.FromIsAnXOfTo,ISNULL(DefaultPersonRelationTypeLanguage.FromIsAnXOfTo,'No from is an X Of to for this relation type')) FromIsAnXOfTo
	, ISNULL(UserPersonRelationTypeLanguage.ToIsAnXOfFrom,ISNULL(DefaultPersonRelationTypeLanguage.ToIsAnXOfFrom,'No to is an X of from for this relation type')) ToIsAnXOfFrom
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonRelationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, PersonRelationTypes.ModifiedDate
FROM PersonRelationTypes 
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver, FromIsAnXOfTo, ToIsAnXOfFrom FROM PersonRelationTypeLanguages WHERE LanguageId = @LanguageID) UserPersonRelationTypeLanguage
	ON UserPersonRelationTypeLanguage.PersonRelationTypeId = PersonRelationTypes.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver, FromIsAnXOfTo, ToIsAnXOfFrom FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPersonRelationTypeLanguage
	ON DefaultPersonRelationTypeLanguage.PersonRelationTypeId = PersonRelationTypes.PersonRelationTypeID
JOIN Persons Creator
	ON Creator.UserId = PersonRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelationTypes.ModifierID
ORDER BY ISNULL(UserPersonRelationTypeLanguage.Name,ISNULL(DefaultPersonRelationTypeLanguage.Name,'No name for this relation type'))


