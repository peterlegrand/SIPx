CREATE PROCEDURE usp_ProjectList (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Projects.ProjectID 
	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this project')) Name
FROM Projects
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectId = Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Projects.ProjectID
JOIN AspNetRoleClaims
	ON CAST(AspNetRoleClaims.ClaimValue as int) = projects.ProjectID
JOIN AspNetUserRoles
	ON AspNetRoleClaims.RoleId=AspNetUserRoles.RoleId
WHERE AspNetRoleClaims.ClaimType = 'ProjectRight'
	AND AspNetUserRoles.UserId = @UserId
ORDER BY ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this project'))

