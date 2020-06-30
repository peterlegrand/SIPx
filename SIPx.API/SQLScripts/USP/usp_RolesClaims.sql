CREATE PROCEDURE [dbo].[usp_RolesClaims] (@UserId nvarchar(450),@RoleId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
	Claims.ClaimId 
	, ClaimGroups.ClaimGroupID
	, ISNULL(UIClaimNameCustom.Customization,UIClaimName.Name) Name
	, ISNULL(UIClaimDescriptionCustom.Customization,UIClaimDescription.Name) Description
	, ISNULL(UIClaimMenuNameCustom.Customization,UIClaimMenuName.Name) MenuName
	, ISNULL(UIClaimMouseOverCustom.Customization,UIClaimMouseOver.Name) MouseOver
	, ISNULL(UIClaimGroupNameCustom.Customization,UIClaimGroupName.Name) GroupName
	, ISNULL(UIClaimGroupDescriptionCustom.Customization,UIClaimGroupDescription.Name) GroupDescription
	, ISNULL(UIClaimGroupMenuNameCustom.Customization,UIClaimGroupMenuName.Name) GroupMenuName
	, ISNULL(UIClaimGroupMouseOverCustom.Customization,UIClaimGroupMouseOver.Name) GroupMouseOver
FROM AspNetRoleClaims
JOIN AspNetRoles
	ON AspNetRoleClaims.RoleId = AspNetRoles.Id
JOIN Claims 
	ON AspNetRoleClaims.ClaimType = Claims.ClaimType 
		AND AspNetRoleClaims.ClaimValue = Claims.ClaimValue
JOIN ClaimGroups
	ON Claims.ClaimGroupId = ClaimGroups.ClaimGroupID
JOIN UITermLanguages UIClaimName
	ON UIClaimName.UITermId = Claims.NameTermID
JOIN UITermLanguages UIClaimDescription
	ON UIClaimDescription.UITermId = Claims.NameTermID
JOIN UITermLanguages UIClaimMenuName
	ON UIClaimMEnuName.UITermId = Claims.NameTermID
JOIN UITermLanguages UIClaimMouseOver
	ON UIClaimMouseOver.UITermId = Claims.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimNameCustom
	ON UIClaimNameCustom.UITermId = Claims.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimDescriptionCustom
	ON UIClaimDescriptionCustom.UITermId = Claims.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimMenuNameCustom
	ON UIClaimMenuNameCustom.UITermId = Claims.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimMouseOverCustom
	ON UIClaimMouseOverCustom.UITermId = Claims.MouseOverTermID
JOIN UITermLanguages UIClaimGroupName
	ON UIClaimGroupName.UITermId = ClaimGroups.NameTermID
JOIN UITermLanguages UIClaimGroupDescription
	ON UIClaimGroupDescription.UITermId = ClaimGroups.NameTermID
JOIN UITermLanguages UIClaimGroupMenuName
	ON UIClaimGroupMEnuName.UITermId = ClaimGroups.NameTermID
JOIN UITermLanguages UIClaimGroupMouseOver
	ON UIClaimGroupMouseOver.UITermId = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimGroupNameCustom
	ON UIClaimGroupNameCustom.UITermId = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimGroupDescriptionCustom
	ON UIClaimGroupDescriptionCustom.UITermId = ClaimGroups.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimGroupMenuNameCustom
	ON UIClaimGroupMenuNameCustom.UITermId = ClaimGroups.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIClaimGroupMouseOverCustom
	ON UIClaimGroupMouseOverCustom.UITermId = ClaimGroups.MouseOverTermID
WHERE UIClaimName.LanguageId = @LanguageID
	AND UIClaimDescription.LanguageId = @LanguageID
	AND UIClaimMenuName.LanguageId = @LanguageID
	AND UIClaimMouseOver.LanguageId = @LanguageID
	AND UIClaimGroupName.LanguageId = @LanguageID
	AND UIClaimGroupDescription.LanguageId = @LanguageID
	AND UIClaimGroupMenuName.LanguageId = @LanguageID
	AND UIClaimGroupMouseOver.LanguageId = @LanguageID
	AND AspNetRoles.Id = @RoleID
ORDER BY 
	ISNULL(UIClaimGroupNameCustom.Customization,UIClaimGroupName.Name)
	, ISNULL(UIClaimNameCustom.Customization,UIClaimName.Name)