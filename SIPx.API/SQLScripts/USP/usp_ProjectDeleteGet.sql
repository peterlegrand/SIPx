CREATE PROCEDURE [dbo].[usp_ProjectDeleteGet] (@UserId nvarchar(450), @ProjectId int) 
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
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, CASE WHEN Projects.ParentProjectId = NULL THEN 'No parent project' ELSE ISNULL(UserParentProjectLanguage.Name,ISNULL(DefaultParentProjectLanguage.Name,'No name for this parent project')) END ParentProjectName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Projects.CreatorID
	, Projects.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Projects.ModifierID
	, Projects.ModifiedDate
FROM   Projects
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserParentProjectLanguage
	ON UserParentProjectLanguage.ProjectID= Projects.ParentProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultParentProjectLanguage
	ON DefaultParentProjectLanguage.ProjectId = Projects.ParentProjectID
JOIN Statuses
	ON Statuses.StatusId = Projects.StatusID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectID= Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectId = Projects.ProjectID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON Statuses.NameTermId = UserStatusName.UITermId  
JOIN Persons Creator
	ON Creator.UserId = Projects.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Projects.ModifierID
WHERE StatusName.LanguageId = @LanguageID
	AND Projects.ProjectId = @ProjectId
END;
