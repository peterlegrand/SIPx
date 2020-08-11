CREATE PROCEDURE [dbo].[usp_ProjectIndexGet] (@UserId nvarchar(450), @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

WITH ProjectHierarchy (ProjectID
	, StatusID
	, Path
	, ProjectTypeID
	, CreatedDate
	, CreatorID
	, ModifierID
	, ModifiedDate)
AS
(
	SELECT 
		Projects.ProjectID
		, StatusID
		, CAST(Projects.ProjectId AS VARCHAR(255)) AS Path
		, ProjectTypeID
		, CreatedDate
		, CreatorID
		, ModifierID
		, ModifiedDate
	FROM Projects 
	WHERE Projects.ParentProjectId IS NULL

   UNION ALL
	SELECT 
		ProjectNextLevel.ProjectID
		, ProjectNextLevel.StatusID
		, CAST(ProjectBaseLevel.Path + '.' + CAST(ProjectNextLevel.ProjectId AS VARCHAR(255)) AS VARCHAR(255))
		, ProjectNextLevel.ProjectTypeID
	, ProjectNextLevel.CreatedDate
	, ProjectNextLevel.CreatorID
	, ProjectNextLevel.ModifierID
	, ProjectNextLevel.ModifiedDate

	FROM Projects ProjectNextLevel
	JOIN ProjectHierarchy ProjectBaseLevel
		ON ProjectBaseLevel.ProjectId = ProjectNextLevel.ParentProjectID
	)
-- Statement using the CTE
SELECT TOP (@Top) 
	ProjectHierarchy.ProjectID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Project')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Project')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Project')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Project')) MouseOver
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, Path
	, ProjectHierarchy.ProjectTypeID
	, ProjectTypeLanguages.Name
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProjectHierarchy.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProjectHierarchy.ModifiedDate
FROM   ProjectHierarchy
JOIN ProjectTypeLanguages
	ON ProjectHierarchy.ProjectTypeID = ProjectTypeLanguages.ProjectTypeID 
JOIN Statuses
	ON Statuses.StatusId = ProjectHierarchy.StatusID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectID= ProjectHierarchy.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectId = ProjectHierarchy.ProjectID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON Statuses.NameTermId = UserStatusName.UITermId  
JOIN Persons Creator
	ON Creator.UserId = ProjectHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectHierarchy.ModifierID
WHERE StatusName.LanguageId = @LanguageID
ORDER BY Path;
END;
