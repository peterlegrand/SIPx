CREATE PROCEDURE [dbo].[usp_Projects] (@UserID nvarchar(450), @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

WITH ProjectHierarchy (ProjectID
	, StatusID
	, Path
	, CreatedDate
	, CreatorID
	, ModifierID
	, ModifiedDate)
AS
(
	SELECT 
		Projects.ProjectID
		, StatusID
		, CAST(Projects.ProjectID AS VARCHAR(255)) AS Path
		, CreatedDate
		, CreatorID
		, ModifierID
		, ModifiedDate
	FROM Projects 
	WHERE Projects.ParentProjectID IS NULL

   UNION ALL
	SELECT 
		ProjectNextLevel.ProjectID
		, ProjectNextLevel.StatusID
		, CAST(ProjectBaseLevel.Path + '.' + CAST(ProjectNextLevel.ProjectID AS VARCHAR(255)) AS VARCHAR(255))
	, ProjectNextLevel.CreatedDate
	, ProjectNextLevel.CreatorID
	, ProjectNextLevel.ModifierID
	, ProjectNextLevel.ModifiedDate

	FROM Projects ProjectNextLevel
	JOIN ProjectHierarchy ProjectBaseLevel
		ON ProjectBaseLevel.ProjectID = ProjectNextLevel.ParentProjectID
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
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProjectHierarchy.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProjectHierarchy.ModifiedDate
FROM   ProjectHierarchy
JOIN Statuses
	ON Statuses.StatusID = ProjectHierarchy.StatusID
LEFT JOIN (SELECT ProjectID, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ProjectID= ProjectHierarchy.ProjectID
LEFT JOIN (SELECT ProjectID, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ProjectID = ProjectHierarchy.ProjectID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermID = StatusName.UITermID  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID)  UserStatusName
	ON Statuses.NameTermID = UserStatusName.UITermID  
JOIN Persons Creator
	ON Creator.UserID = ProjectHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProjectHierarchy.ModifierID
WHERE StatusName.LanguageID = @LanguageID
ORDER BY Path;
END;
