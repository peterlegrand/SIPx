CREATE PROCEDURE [dbo].[RoleLanguage] (@RoleLanguageID int) 
AS 
SELECT AspNetRoles.ID 
	, RoleLanguages.RoleLanguageID
	, RoleLanguages.LanguageID
	, RoleLanguages.Name
	, RoleLanguages.Description
	, RoleLanguages.MenuName
	, RoleLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, RoleLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, RoleLanguages.ModifiedDate
FROM AspNetRoles
JOIN RoleLanguages
	ON AspNetRoles.ID = RoleLanguages.RoleID
JOIN Persons Creator
	ON Creator.UserID = RoleLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = RoleLanguages.ModifierID
WHERE RoleLanguages.RoleLanguageID = @RoleLanguageID
