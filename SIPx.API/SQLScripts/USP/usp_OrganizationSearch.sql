CREATE PROCEDURE usp_OrganizationSearch(@Contains nvarchar(500),  @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Organizations.OrganizationID
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, ISNULL(OrganizationUserLanguage.Description,ISNULL(OrganizationDefaultLanguage.Description,'No description for this organization')) OrganizationDescription
	, Persons.FirstName + ' ' + Persons.LastName CreatorName
	, Persons.PersonID CreatorId
	, Organizations.CreatedDate

FROM 
	Organizations
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID, FullText FROM OrganizationLanguages WHERE LanguageId = @LanguageID AND Freetext(OrganizationLanguages.Fulltext, @Contains)) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID, FullText FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 AND Freetext(OrganizationLanguages.Fulltext, @Contains)) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = Organizations.OrganizationID
JOIN Persons 
	ON Persons.UserID = Organizations.CreatorID
WHERE OrganizationUserLanguage.OrganizationID IS NOT NULL AND OrganizationDefaultLanguage.OrganizationID IS NOT NULL