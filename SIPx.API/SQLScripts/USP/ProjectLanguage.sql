CREATE PROCEDURE [dbo].[ProjectLanguage] (@ProjectLanguageID int) 
AS 
SELECT Projects.ProjectID 
	, ProjectLanguages.ProjectLanguageID
	, ProjectLanguages.LanguageID
	, ProjectLanguages.Name
	, ProjectLanguages.Description
	, ProjectLanguages.MenuName
	, ProjectLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProjectLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProjectLanguages.ModifiedDate
FROM Projects
JOIN ProjectLanguages
	ON Projects.ProjectID = ProjectLanguages.ProjectID
JOIN Persons Creator
	ON Creator.UserID = ProjectLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProjectLanguages.ModifierID
WHERE ProjectLanguages.ProjectLanguageID = @ProjectLanguageID
