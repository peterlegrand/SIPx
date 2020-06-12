CREATE PROCEDURE [dbo].[usp_ContentCreate1a] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;

DECLARE @SecurityLevelID int;
SELECT @SecurityLevelID = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;

SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Languages.LanguageID
	, ISNULL(Customization,Name ) Name 
FROM Languages 
JOIN UITermLanguages ON Languages.NameTermID = UITermLanguages.UITermID
LEFT JOIN (SELECT UITermLanguageCustomizations.UITermID, UITermLanguageCustomizations.Customization FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID) Customization
	ON Customization.UITermID = Languages.NameTermID
WHERE Languages.StatusID = 1 AND UITermLanguages.LanguageID = @LanguageID
ORDER BY Name

exec usp_ContentTypes @userID

SELECT CAST(OrganizationClaim.ClaimValue as int), ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name 
FROM AspNetUserRoles 
JOIN AspNetRoleClaims CreateContent
	ON AspNetUserRoles.RoleId = CreateContent.RoleId
JOIN AspNetRoleClaims OrganizationClaim
	ON AspNetUserRoles.RoleId = OrganizationClaim.RoleId
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= CAST(OrganizationClaim.ClaimValue as int)
LEFT JOIN (SELECT OrganizationID, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationID = CAST(OrganizationClaim.ClaimValue as int)
WHERE CreateContent.ClaimType = 'ApplicationRight' 
	AND CreateContent.ClaimValue = '1'
	AND OrganizationClaim.ClaimType = 'OrganizationRight'