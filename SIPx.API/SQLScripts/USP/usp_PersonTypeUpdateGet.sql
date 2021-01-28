CREATE PROCEDURE usp_PersonTypeUpdateGet (@UserId nvarchar(450), @PersonTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PersonTypes.PersonTypeID
	, PersonTypes.CodePrefix
	, PersonTypes.CodeSuffix
	, PersonTypes.CodeTypeId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Person type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this Person type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this Person type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Person type')) MouseOver
	, PersonTypes.IconID
	, PersonTypes.Color
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonTypes.ModifiedDate
FROM PersonTypes 
LEFT JOIN (SELECT PersonTypeId, Name, Description, MenuName, MouseOver FROM PersonTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PersonTypeID= PersonTypes.PersonTypeID
LEFT JOIN (SELECT PersonTypeId, Name, Description, MenuName, MouseOver FROM PersonTypeLanguages JOIN Settings ON PersonTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PersonTypeId = PersonTypes.PersonTypeID
JOIN Persons Creator
	ON Creator.UserId = PersonTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTypes.ModifierID
WHERE PersonTypes.PersonTypeId = @PersonTypeID
