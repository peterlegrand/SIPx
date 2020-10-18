CREATE PROCEDURE [dbo].[usp_ProjectUpdateGet] (@UserId nvarchar(450), @ProjectId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT
	Projects.ProjectID
	, Projects.ParentProjectID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Project')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Project')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Project')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Project')) MouseOver
	, projects.StatusID 
	, projects.ProjectTypeID
	, projects.SecurityLevelID
	, CASE WHEN Projects.ParentProjectId = NULL THEN 'No parent project' ELSE ISNULL(UserParentProjectLanguage.Name,ISNULL(DefaultParentProjectLanguage.Name,'No name for this parent project')) END ProjectParentName
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
JOIN Persons Creator
	ON Creator.UserId = Projects.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Projects.ModifierID
WHERE  Projects.ProjectId = @ProjectId

END;
