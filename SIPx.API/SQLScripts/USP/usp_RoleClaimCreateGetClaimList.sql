CREATE PROCEDURE [dbo].[usp_RoleClaimCreateGetClaimList] (@UserId nvarchar(450), @RoleID nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Claims.ClaimId 
	, CONCAT(ISNULL(UINameCustom.Customization,UIName.Name), ' - ',  ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name)) Name
FROM Claims
JOIN UITermLanguages UIName
	ON UIName.UITermId = Claims.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Claims.NameTermID
JOIN ClaimGroups
	ON Claims.ClaimGroupID = ClaimGroups.ClaimGroupID
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermId = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermId = ClaimGroups.NameTermID
WHERE UIName.LanguageId = @LanguageID 
	AND UIGroupName.LanguageId = @LanguageID 
	AND Claims.ClaimID NOT IN (SELECT ClaimID FROM Claims JOIN AspNetRoleClaims ON Claims.ClaimType = AspNetRoleClaims.ClaimType AND Claims.ClaimValue = AspNetRoleClaims.ClaimValue WHERE AspNetRoleClaims.RoleId = @RoleID)
ORDER BY ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) 
	, ISNULL(UINameCustom.Customization,UIName.Name)
