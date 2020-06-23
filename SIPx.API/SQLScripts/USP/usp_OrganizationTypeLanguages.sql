CREATE PROCEDURE [dbo].[usp_OrganizationTypeLanguages] (@OrganizationTypeID int) 
AS 
SELECT OrganizationTypes.OrganizationTypeID 
	, OrganizationTypeLanguages.OrganizationTypeLanguageID
	, OrganizationTypeLanguages.LanguageID
	, OrganizationTypeLanguages.Name
	, OrganizationTypeLanguages.Description
	, OrganizationTypeLanguages.MenuName
	, OrganizationTypeLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationTypeLanguages.ModifiedDate
FROM OrganizationTypes
JOIN OrganizationTypeLanguages
	ON OrganizationTypes.OrganizationTypeID = OrganizationTypeLanguages.OrganizationTypeID
JOIN Persons Creator
	ON Creator.UserID = OrganizationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationTypeLanguages.ModifierID
WHERE OrganizationTypes.OrganizationTypeID = @OrganizationTypeID


