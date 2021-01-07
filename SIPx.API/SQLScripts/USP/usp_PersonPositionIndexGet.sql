CREATE PROCEDURE usp_PersonPositionIndexGet (@UserId nvarchar(450), @PersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationPersons.OrganizationPersonID 
	, Organizations.OrganizationID
	, OrganizationPersons.PersonId
	, OrganizationPersons.PositionID
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this organization')) OrganizationName
	, ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this position')) PositionName
	, Persons.FirstName
	, Persons.LastName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationPersons.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationPersons.ModifiedDate
	, OrganizationTypes.Internal InternalOrganizationNormalUserCannotDelete
FROM OrganizationPersons
JOIN Organizations
	ON OrganizationPersons.OrganizationId = Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Organizations.OrganizationID

JOIN Persons 
	ON Persons.PersonID = OrganizationPersons.PersonId
JOIN Positions
	ON Positions.PositionID = OrganizationPersons.PositionID

LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageID FROM PositionLanguages WHERE LanguageId = @LanguageID) UserPositionLanguage
	ON UserPositionLanguage.PositionID= Positions.PositionID
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageID FROM PositionLanguages JOIN Settings ON PositionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPositionLanguage
	ON DefaultPositionLanguage.PositionId = Positions.PositionID

JOIN OrganizationTypes 
	ON Organizations.OrganizationTypeID = OrganizationTypes.OrganizationTypeID
JOIN Persons Creator
	ON Creator.UserId = OrganizationPersons.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationPersons.ModifierID
WHERE  OrganizationPersons.PersonId = @PersonId
ORDER BY Persons.FirstName
	, Persons.LastName
