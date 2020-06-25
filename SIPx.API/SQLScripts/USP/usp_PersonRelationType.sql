CREATE PROCEDURE [dbo].[usp_PersonRelationType] (@UserID nvarchar(450), @PersonRelationTypeID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT PersonRelationTypes.PersonRelationTypeID
	, ISNULL(UserPersonRelationTypeLanguage.Name,ISNULL(DefaultPersonRelationTypeLanguage.Name,'No name for this relation type')) Name
	, ISNULL(UserPersonRelationTypeLanguage.Description,ISNULL(DefaultPersonRelationTypeLanguage.Description,'No description for this relation type')) Description
	, ISNULL(UserPersonRelationTypeLanguage.MenuName,ISNULL(DefaultPersonRelationTypeLanguage.MenuName,'No menu name for this relation type')) MenuName
	, ISNULL(UserPersonRelationTypeLanguage.MouseOver,ISNULL(DefaultPersonRelationTypeLanguage.MouseOver,'No mouse over for this relation type')) MouseOver
	, ISNULL(UserPersonRelationTypeLanguage.FromIsAnXOfTo,ISNULL(DefaultPersonRelationTypeLanguage.FromIsAnXOfTo,'No from is an X Of to for this relation type')) FromIsAnXOfTo
	, ISNULL(UserPersonRelationTypeLanguage.ToIsAnXOfFrom,ISNULL(DefaultPersonRelationTypeLanguage.ToIsAnXOfFrom,'No to is an X of from for this relation type')) ToIsAnXOfFrom
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PersonRelationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PersonRelationTypes.ModifiedDate
FROM PersonRelationTypes 
LEFT JOIN (SELECT PersonRelationTypeID, Name, Description, MenuName, MouseOver, FromIsAnXOfTo, ToIsAnXOfFrom FROM PersonRelationTypeLanguages WHERE LanguageID = @LanguageID) UserPersonRelationTypeLanguage
	ON UserPersonRelationTypeLanguage.PersonRelationTypeID = PersonRelationTypes.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeID, Name, Description, MenuName, MouseOver, FromIsAnXOfTo, ToIsAnXOfFrom FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultPersonRelationTypeLanguage
	ON DefaultPersonRelationTypeLanguage.PersonRelationTypeID = PersonRelationTypes.PersonRelationTypeID
JOIN Persons Creator
	ON Creator.UserID = PersonRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PersonRelationTypes.ModifierID
WHERE PersonRelationTypes.PersonRelationTypeID = @PersonRelationTypeID


