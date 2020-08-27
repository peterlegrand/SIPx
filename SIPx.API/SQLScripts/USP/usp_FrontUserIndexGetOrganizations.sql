CREATE PROCEDURE [dbo].[usp_FrontUserIndexGetOrganizations] (@CurrentUserId nvarchar(450), @SelectedPersonId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT AspNetRoles.Name RoleName 
	, Organizations.OrganizationID
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this organization')) OrganizationName
FROM AspNetUserRoles
JOIN Persons	
	ON Persons.UserID = AspNetUserRoles.UserId
JOIN AspNetRoles
	ON AspNetUserRoles.RoleId = AspNetRoles.Id
JOIN AspNetRoleClaims
	ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId
JOIN Organizations
	ON Organizations.OrganizationID =  CAST(AspNetRoleClaims.ClaimValue as int)
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Organizations.OrganizationID
WHERE AspNetRoleClaims.ClaimType = 'OrganizationRight'
	AND @SelectedPersonId = Persons.PersonID
	end;