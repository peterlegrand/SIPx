CREATE PROCEDURE [dbo].[usp_FrontOrganizationIndexGetMember] (@UserId nvarchar(450), @OrganizationId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

select AspNetRoles.Id RoleId
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,AspNetRoles.Name)) RoleName
	, Persons.UserID
	, Persons.PersonID
	, Persons.FirstName
	, Persons.LastName
	, Persons.DefaultOrganizationID
 	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No organization name')) OrganizationName

FROM AspNetRoleClaims 
JOIN AspNetRoles 
	ON AspNetRoleClaims.RoleId = AspNetRoles.Id
LEFT JOIN (SELECT RoleId, Name FROM RoleLanguages WHERE LanguageId = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleID= AspNetRoles.Id
LEFT JOIN (SELECT RoleId, Name FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleID = AspNetRoles.Id
JOIN AspNetUserRoles
	ON AspNetRoles.Id = AspNetUserRoles.RoleId
JOIN Persons
	ON Persons.UserID = AspNetUserRoles.UserId
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationID = Persons.DefaultOrganizationID
WHERE ClaimType = 'OrganizationRight'
	AND ClaimValue = CAST(@OrganizationId as char(10))
ORDER BY 	
	ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,AspNetRoles.Name)) 
	, Persons.FirstName
	, Persons.LastName

END;