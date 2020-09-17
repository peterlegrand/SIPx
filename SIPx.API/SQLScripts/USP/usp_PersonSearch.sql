CREATE PROCEDURE usp_PersonSearch(@Contains nvarchar(500),  @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Persons.PersonID
	, Persons.FirstName
	, Persons.MiddleName
	, persons.LastName
	, Persons.NickName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, persons.DefaultOrganizationID OrganizationId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Persons.CreatedDate

FROM 
	Persons
JOIN OrganizationLanguages
	ON Persons.DefaultOrganizationID = OrganizationLanguages.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID= Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserId = Persons.CreatorID

WHERE Contains(Persons.Fulltext, @Contains)
	AND OrganizationLanguages.LanguageID = @LanguageID