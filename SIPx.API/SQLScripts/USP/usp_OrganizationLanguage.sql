CREATE PROCEDURE [dbo].[usp_OrganizationLanguage] (@OrganizationLanguageID int) 
AS 
SELECT Organizations.OrganizationID 
	, OrganizationLanguages.OrganizationLanguageID
	, OrganizationLanguages.LanguageID
	, OrganizationLanguages.Name
	, OrganizationLanguages.Description
	, OrganizationLanguages.MenuName
	, OrganizationLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationLanguages.ModifiedDate
FROM Organizations
JOIN OrganizationLanguages
	ON Organizations.OrganizationID = OrganizationLanguages.OrganizationID
JOIN Persons Creator
	ON Creator.UserID = OrganizationLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationLanguages.ModifierID
WHERE OrganizationLanguages.OrganizationLanguageID = @OrganizationLanguageID


