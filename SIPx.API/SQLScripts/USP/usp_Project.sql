CREATE PROCEDURE [dbo].[usp_Project] (@UserID nvarchar(450), @ProjectID int) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT
	Projects.ProjectID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Project')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Project')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Project')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Project')) MouseOver
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, CASE WHEN Projects.ParentProjectID = NULL THEN 'No parent project' ELSE ISNULL(UserParentProjectLanguage.Name,ISNULL(DefaultParentProjectLanguage.Name,'No name for this parent project')) END ParentProjectName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Projects.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Projects.ModifiedDate
FROM   Projects
LEFT JOIN (SELECT ProjectID, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageID = @LanguageID) UserParentProjectLanguage
	ON UserParentProjectLanguage.ProjectID= Projects.ParentProjectID
LEFT JOIN (SELECT ProjectID, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultParentProjectLanguage
	ON DefaultParentProjectLanguage.ProjectID = Projects.ParentProjectID
JOIN Statuses
	ON Statuses.StatusID = Projects.StatusID
LEFT JOIN (SELECT ProjectID, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ProjectID= Projects.ProjectID
LEFT JOIN (SELECT ProjectID, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ProjectID = Projects.ProjectID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermID = StatusName.UITermID  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID)  UserStatusName
	ON Statuses.NameTermID = UserStatusName.UITermID  
JOIN Persons Creator
	ON Creator.UserID = Projects.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = Projects.ModifierID
WHERE StatusName.LanguageID = @LanguageID
ORDER BY Path;
END;
