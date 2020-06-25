CREATE PROCEDURE [dbo].[usp_RoleGroupLanguages] (@RoleGroupID int) 
AS 
SELECT RoleGroups.RoleGroupID 
	, RoleGroupLanguages.RoleGroupLanguageID
	, RoleGroupLanguages.LanguageID
	, RoleGroupLanguages.Name
	, RoleGroupLanguages.Description
	, RoleGroupLanguages.MenuName
	, RoleGroupLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, RoleGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, RoleGroupLanguages.ModifiedDate
FROM RoleGroups
JOIN RoleGroupLanguages
	ON RoleGroups.RoleGroupID = RoleGroupLanguages.RoleGroupID
JOIN Persons Creator
	ON Creator.UserID = RoleGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = RoleGroupLanguages.ModifierID
WHERE RoleGroups.RoleGroupID = @RoleGroupID
