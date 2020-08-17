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
	, ISNULL(UserPersonRelationTypeLanguage.Name,ISNULL(DefaultPersonRelationTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserPersonRelationTypeLanguage.Description,ISNULL(DefaultPersonRelationTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserPersonRelationTypeLanguage.MenuName,ISNULL(DefaultPersonRelationTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserPersonRelationTypeLanguage.MouseOver,ISNULL(DefaultPersonRelationTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, PersonRelationTypes.CreatorID
	, PersonRelationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, PersonRelationTypes.ModifierID
	, PersonRelationTypes.ModifiedDate
FROM PersonRelationTypes
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver, PersonRelationTypeLanguageId FROM PersonRelationTypeLanguages WHERE LanguageId = @LanguageID) UserPersonRelationTypeLanguage
	ON UserPersonRelationTypeLanguage.PersonRelationTypeId = PersonRelationTypes.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver, PersonRelationTypeLanguageId FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPersonRelationTypeLanguage
	ON DefaultPersonRelationTypeLanguage.PersonRelationTypeId = PersonRelationTypes.PersonRelationTypeID

JOIN Persons Creator
	ON Creator.UserId = PersonRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelationTypes.ModifierID
WHERE  PersonRelationTypes.PersonRelationTypeId = @PersonRelationTypeId
