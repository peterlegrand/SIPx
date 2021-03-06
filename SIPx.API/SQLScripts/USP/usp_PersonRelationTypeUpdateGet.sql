CREATE PROCEDURE [dbo].[usp_PersonRelationTypeUpdateGet] (@UserId nvarchar(450), @PersonRelationTypeID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PersonRelationTypes.PersonRelationTypeId 
	, PersonRelationTypes.SeePersonal
	, PersonRelationTypes.Color
	, PersonRelationTypes.IconID
	, ISNULL(UserPersonRelationTypeLanguage.Name,ISNULL(DefaultPersonRelationTypeLanguage.Name,'No name for this RelationType')) Name
	, ISNULL(UserPersonRelationTypeLanguage.Description,ISNULL(DefaultPersonRelationTypeLanguage.Description,'No description for this RelationType')) Description
	, ISNULL(UserPersonRelationTypeLanguage.MenuName,ISNULL(DefaultPersonRelationTypeLanguage.MenuName,'No menu name for this RelationType')) MenuName
	, ISNULL(UserPersonRelationTypeLanguage.MouseOver,ISNULL(DefaultPersonRelationTypeLanguage.MouseOver,'No mouse over for this RelationType')) MouseOver
	, ISNULL(UserPersonRelationTypeLanguage.FromIsAnXOfTo,ISNULL(DefaultPersonRelationTypeLanguage.FromIsAnXOfTo,'No FromIsAnXOfTo for this RelationType')) FromIsAnXOfTo
	, ISNULL(UserPersonRelationTypeLanguage.ToIsAnXOfFrom,ISNULL(DefaultPersonRelationTypeLanguage.ToIsAnXOfFrom,'No ToIsAnXOfFrom for this RelationType')) ToIsAnXOfFrom
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonRelationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonRelationTypes.ModifiedDate
FROM PersonRelationTypes
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver, PersonRelationTypeLanguageId, FromIsAnXOfTo, ToIsAnXOfFrom FROM PersonRelationTypeLanguages WHERE LanguageId = @LanguageID) UserPersonRelationTypeLanguage
	ON UserPersonRelationTypeLanguage.PersonRelationTypeId = PersonRelationTypes.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver, PersonRelationTypeLanguageId, FromIsAnXOfTo, ToIsAnXOfFrom FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPersonRelationTypeLanguage
	ON DefaultPersonRelationTypeLanguage.PersonRelationTypeId = PersonRelationTypes.PersonRelationTypeID

JOIN Persons Creator
	ON Creator.UserId = PersonRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelationTypes.ModifierID
WHERE  PersonRelationTypes.PersonRelationTypeId = @PersonRelationTypeId
