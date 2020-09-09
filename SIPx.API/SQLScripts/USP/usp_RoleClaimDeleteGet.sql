CREATE PROCEDURE usp_RoleClaimDeleteGet (@UserId nvarchar(450),@roleClaimId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT AspNetRoleClaims.Id RoleClaimId
	, ISNULL(CustomClaims.Customization,DefaultClaims.Name) ClaimName
	, ISNULL(CustomClaimGroups.Customization,DefaultClaimGroups.Name) ClaimGroupName
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role')) RoleName
	, AspNetRoles.Id RoleId
	FROM AspNetRoleClaims
JOIN AspNetRoles
	ON AspNetRoles.Id = AspNetRoleClaims.RoleId 
LEFT JOIN (SELECT RoleId, Name FROM RoleLanguages WHERE LanguageId = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleId = AspNetRoles.ID
LEFT JOIN (SELECT RoleId, Name FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleId = AspNetRoles.Id
JOIN Claims
	ON Claims.ClaimType = AspNetRoleClaims.ClaimType
		AND Claims.ClaimValue = AspNetRoleClaims.ClaimValue
JOIN UITermLanguages DefaultClaims
	ON DefaultClaims.UITermId = Claims.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomClaims
	ON CustomClaims.UITermId = Claims.NameTermID
JOIN ClaimGroups
	ON Claims.ClaimGroupID = ClaimGroups.ClaimGroupID
JOIN UITermLanguages DefaultClaimGroups
	ON DefaultClaimGroups.UITermId = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomClaimGroups
	ON CustomClaimGroups.UITermId = ClaimGroups.NameTermID
WHERE DefaultClaims.LanguageId = @LanguageID
	AND DefaultClaimGroups.LanguageId = @LanguageID
	AND AspNetRoleClaims.Id = @RoleClaimID
