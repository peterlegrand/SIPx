CREATE PROCEDURE usp_RoleUpdateGet (@UserId nvarchar(450),@RoleId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT AspNetRoles. Id RoleID
	, AspNetRoles.Name InternalName
	, RoleLanguages.RoleLanguageID
	, RoleLanguages.Name
	, RoleLanguages.Description
	, RoleLanguages.MenuName
	, RoleLanguages.MouseOver
	, AspNetRoles.RoleGroupID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, RoleLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, RoleLanguages.ModifiedDate
FROM AspNetRoles
JOIN RoleLanguages 
	ON AspNetRoles.Id = RoleLanguages.RoleID
JOIN Persons Creator
	ON Creator.UserId = RoleLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = RoleLanguages.ModifierID
WHERE RoleLanguages.LanguageId = @LanguageID
	AND AspNetRoles.Id = @RoleID
