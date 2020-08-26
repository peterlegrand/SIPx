CREATE PROCEDURE [dbo].[usp_FrontProjectIndexGet] (@UserId nvarchar(450), @ProjectId int) 
AS 
BEGIN
DECLARE @LanguageId int;
DECLARE @SecurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT @SecurityLevelId = SecurityLevelId
FROM AspNetUsers
WHERE Id = @UserID
;


SELECT
	Projects.ProjectID
	, Projects.ParentProjectID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Project')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Project')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Project')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Project')) MouseOver
	, Projects.StatusID 
	, CASE WHEN Projects.ParentProjectId = NULL THEN 'No parent Project' ELSE ISNULL(UserParentProjectLanguage.Name,ISNULL(DefaultParentProjectLanguage.Name,'No name for this parent Project')) END ParentProjectName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, Projects.ProjectTypeID
	, ProjectTypeLanguages.Name ProjectTypeName
	, Projects.SecurityLevelID
	, ISNULL( UserSecurityLevelName.Customization, SecurityLevelName.Name) SecurityLevelName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Projects.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Projects.ModifiedDate
FROM   Projects
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserParentProjectLanguage
	ON UserParentProjectLanguage.ProjectID= Projects.ParentProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultParentProjectLanguage
	ON DefaultParentProjectLanguage.ProjectId = Projects.ParentProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectID= Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectId = Projects.ProjectID
JOIN ProjectTypeLanguages
	ON Projects.ProjectTypeID = ProjectTypeLanguages.ProjectTypeID 
JOIN Statuses
	ON Statuses.StatusId = Projects.StatusID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON Statuses.NameTermId = UserStatusName.UITermId  
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelId = Projects.SecurityLevelID
JOIN UITermLanguages SecurityLevelName
	ON SecurityLevels.NameTermId = SecurityLevelName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserSecurityLevelName
	ON SecurityLevels.NameTermId = UserSecurityLevelName.UITermId  

JOIN Persons Creator
	ON Creator.UserId = Projects.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Projects.ModifierID
WHERE  Projects.ProjectId = @ProjectId
	AND StatusName.LanguageId = @LanguageID
	AND SecurityLevelName.LanguageId = @LanguageID
	AND Projects.SecurityLevelId <= @SecurityLevelId 
END;
