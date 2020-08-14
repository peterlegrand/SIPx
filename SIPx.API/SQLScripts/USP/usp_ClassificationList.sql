CREATE PROCEDURE usp_ClassificationList (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Classifications.ClassificationID 
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this Classification')) Name
FROM Classifications
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN AspNetRoleClaims
	ON CAST(AspNetRoleClaims.ClaimValue as int) = Classifications.ClassificationID
JOIN AspNetUserRoles
	ON AspNetRoleClaims.RoleId=AspNetUserRoles.RoleId
WHERE AspNetRoleClaims.ClaimType = 'ClassificationRight'
	AND AspNetUserRoles.UserId = @UserId
ORDER BY ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this Classification'))

