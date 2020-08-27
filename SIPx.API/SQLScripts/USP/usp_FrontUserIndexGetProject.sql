CREATE PROCEDURE [dbo].[usp_FrontUserIndexGetProject] (@CurrentUserId nvarchar(450), @SelectedPersonId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT AspNetRoles.Name RoleName
	, Projects.ProjectID
	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this Project')) ProjectName
FROM AspNetUserRoles
JOIN Persons	
	ON Persons.UserID = AspNetUserRoles.UserId
JOIN AspNetRoles
	ON AspNetUserRoles.RoleId = AspNetRoles.Id
JOIN AspNetRoleClaims
	ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId
JOIN Projects
	ON Projects.ProjectID =  CAST(AspNetRoleClaims.ClaimValue as int)
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectID= Projects.ProjectID
WHERE AspNetRoleClaims.ClaimType = 'ProjectRight'
	AND @SelectedPersonId = Persons.PersonID
	end;