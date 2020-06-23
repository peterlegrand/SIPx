CREATE PROCEDURE [dbo].[usp_RolesClaims] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT 
	aspnetroles.id
	, rolegroups.RoleGroupID
	, Claims.ClaimID 
	, ClaimGroups.ClaimGroupID
	, ISNULL(UIClaimNameCustom.Customization,UIClaimName.Name) ClaimName
	, ISNULL(UIClaimDescriptionCustom.Customization,UIClaimDescription.Name) ClaimDescription
	, ISNULL(UIClaimMenuNameCustom.Customization,UIClaimMenuName.Name) MenuName
	, ISNULL(UIClaimMouseOverCustom.Customization,UIClaimMouseOver.Name) MouseOver
	, ISNULL(UIClaimGroupNameCustom.Customization,UIClaimGroupName.Name) ClaimGroupName
	, ISNULL(UIClaimGroupDescriptionCustom.Customization,UIClaimGroupDescription.Name) ClaimGroupDescription
	, ISNULL(UIClaimGroupMenuNameCustom.Customization,UIClaimGroupMenuName.Name) ClaimGroupMenuName
	, ISNULL(UIClaimGroupMouseOverCustom.Customization,UIClaimGroupMouseOver.Name) ClaimGroupMouseOver
	, ISNULL(RoleUserLanguage.Name,RoleDefaultLanguage.Name) RoleName
	, ISNULL(RoleUserLanguage.Description,RoleDefaultLanguage.Description) RoleDescription
	, ISNULL(RoleUserLanguage.MenuName,RoleDefaultLanguage.MenuName) RoleMenuName
	, ISNULL(RoleUserLanguage.MouseOver,RoleDefaultLanguage.MouseOver) RoleMouseOver
	, ISNULL(RoleGroupUserLanguage.Name,RoleGroupDefaultLanguage.Name) RoleGroupName
	, ISNULL(RoleGroupUserLanguage.Description,RoleGroupDefaultLanguage.Description) RoleGroupDescription
	, ISNULL(RoleGroupUserLanguage.MenuName,RoleGroupDefaultLanguage.MenuName) RoleGroupMenuName
	, ISNULL(RoleGroupUserLanguage.MouseOver,RoleGroupDefaultLanguage.MouseOver) RoleGroupMouseOver
FROM AspNetRoleClaims
JOIN AspNetRoles
	ON AspNetRoleClaims.RoleId = AspNetRoles.Id
JOIN RoleLanguages RoleUserLanguage
	ON RoleUserLanguage.RoleID = AspNetRoles.Id
JOIN RoleLanguages RoleDefaultLanguage
	ON RoleDefaultLanguage.RoleID = AspNetRoles.Id
JOIN Settings RoleSettings
	ON RoleDefaultLanguage.LanguageID = RoleSettings.IntValue
JOIN RoleGroups	
	ON RoleGroups.RoleGroupID = aspnetroles.RoleGroupID
JOIN RoleGroupLanguages RoleGroupUserLanguage
	ON RoleGroupUserLanguage.RoleGroupID = Rolegroups.RoleGroupID
JOIN RoleGroupLanguages RoleGroupDefaultLanguage
	ON RoleGroupDefaultLanguage.RoleGroupID = Rolegroups.RoleGroupID
JOIN Settings RoleGroupSettings
	ON RoleGroupDefaultLanguage.LanguageID = RoleGroupSettings.IntValue
JOIN Claims 
	ON AspNetRoleClaims.ClaimType = Claims.ClaimType 
		AND AspNetRoleClaims.ClaimValue = Claims.ClaimValue
JOIN ClaimGroups
	ON Claims.ClaimGroupID = ClaimGroups.ClaimGroupID
JOIN UITermLanguages UIClaimName
	ON UIClaimName.UITermID = Claims.NameTermID
JOIN UITermLanguages UIClaimDescription
	ON UIClaimDescription.UITermID = Claims.NameTermID
JOIN UITermLanguages UIClaimMenuName
	ON UIClaimMEnuName.UITermID = Claims.NameTermID
JOIN UITermLanguages UIClaimMouseOver
	ON UIClaimMouseOver.UITermID = Claims.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimNameCustom
	ON UIClaimNameCustom.UITermID = Claims.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimDescriptionCustom
	ON UIClaimDescriptionCustom.UITermID = Claims.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimMenuNameCustom
	ON UIClaimMenuNameCustom.UITermID = Claims.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimMouseOverCustom
	ON UIClaimMouseOverCustom.UITermID = Claims.MouseOverTermID
JOIN UITermLanguages UIClaimGroupName
	ON UIClaimGroupName.UITermID = ClaimGroups.NameTermID
JOIN UITermLanguages UIClaimGroupDescription
	ON UIClaimGroupDescription.UITermID = ClaimGroups.NameTermID
JOIN UITermLanguages UIClaimGroupMenuName
	ON UIClaimGroupMEnuName.UITermID = ClaimGroups.NameTermID
JOIN UITermLanguages UIClaimGroupMouseOver
	ON UIClaimGroupMouseOver.UITermID = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimGroupNameCustom
	ON UIClaimGroupNameCustom.UITermID = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimGroupDescriptionCustom
	ON UIClaimGroupDescriptionCustom.UITermID = ClaimGroups.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimGroupMenuNameCustom
	ON UIClaimGroupMenuNameCustom.UITermID = ClaimGroups.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIClaimGroupMouseOverCustom
	ON UIClaimGroupMouseOverCustom.UITermID = ClaimGroups.MouseOverTermID
WHERE UIClaimName.LanguageID = @LanguageID
	AND UIClaimDescription.LanguageID = @LanguageID
	AND UIClaimMenuName.LanguageID = @LanguageID
	AND UIClaimMouseOver.LanguageID = @LanguageID
	AND UIClaimGroupName.LanguageID = @LanguageID
	AND UIClaimGroupDescription.LanguageID = @LanguageID
	AND UIClaimGroupMenuName.LanguageID = @LanguageID
	AND UIClaimGroupMouseOver.LanguageID = @LanguageID
	AND RoleUserLanguage.LanguageID = @LanguageID
	AND RoleGroupUserLanguage.LanguageID = @LanguageID
	AND RoleGroupSettings.SettingID = 1
	AND RoleSettings.SettingID = 1
ORDER BY 
	Rolegroups.Sequence
	, ISNULL(RoleUserLanguage.Name,RoleDefaultLanguage.Name)
	, ISNULL(UIClaimGroupNameCustom.Customization,UIClaimGroupName.Name)
	, ISNULL(UIClaimNameCustom.Customization,UIClaimName.Name)