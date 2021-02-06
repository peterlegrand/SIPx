CREATE PROCEDURE usp_ContentSearch(@Contains nvarchar(500),  @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Contents.ContentID 
	, Contents.Title
	, ContentVersions.Description
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, Contents.OrganizationID
	, Persons.FirstName + ' ' + Persons.LastName CreatorName
	, Persons.PersonID CreatorId
	, Contents.CreatedDate
FROM --CONTAINSTABLE(contents, Fulltext,@Contains) AS ContentKey 
--JOIN 
	Contents 
JOIN ContentVersions	
	ON Contents.ActiveVersionId = Contentversions.ContentVersionId
--	ON ContentKey.Key = Contents.ContentID
JOIN Persons 
	ON Persons.UserID = Contents.CreatorID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID= Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = Persons.DefaultOrganizationID
WHERE Contains(Contents.Title, @Contains) OR Contains(ContentVersions.Description, @Contains) 