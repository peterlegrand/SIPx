CREATE PROCEDURE [dbo].[usp_ContentCreateOrganizations] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;

SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


SELECT CAST(OrganizationClaim.ClaimValue as int) OrganizationId, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name 
FROM AspNetUserRoles 
JOIN AspNetRoleClaims CreateContent
	ON AspNetUserRoles.RoleId = CreateContent.RoleId
JOIN AspNetRoleClaims OrganizationClaim
	ON AspNetUserRoles.RoleId = OrganizationClaim.RoleId
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= CAST(OrganizationClaim.ClaimValue as int)
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationId = CAST(OrganizationClaim.ClaimValue as int)
WHERE CreateContent.ClaimType = 'ApplicationRight' 
	AND CreateContent.ClaimValue = '1'
	AND OrganizationClaim.ClaimType = 'OrganizationRight'