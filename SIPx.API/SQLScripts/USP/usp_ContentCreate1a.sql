CREATE PROCEDURE [dbo].[usp_ContentCreate1a] (@UserId nvarchar(450), @ContentTypeId int) 
AS 
DECLARE @LanguageId int;

DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;

SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT Languages.LanguageID
	, ISNULL(Customization,Name ) Name 
FROM Languages 
JOIN UITermLanguages ON Languages.NameTermId = UITermLanguages.UITermID
LEFT JOIN (SELECT UITermLanguageCustomizations.UITermId, UITermLanguageCustomizations.Customization FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID) Customization
	ON Customization.UITermId = Languages.NameTermID
WHERE Languages.StatusId = 1 AND UITermLanguages.LanguageId = @LanguageID
ORDER BY Name

SELECT
	ContentTypeClassifications.ClassificationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
FROM ContentTypeClassifications
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= ContentTypeClassifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = ContentTypeClassifications.ClassificationID
WHERE ContentTypeClassifications.ContentTypeId = @ContentTypeID
	AND ContentTypeClassifications.ObjectTypeClassificationStatusId <> 1
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification'))

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