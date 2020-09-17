CREATE PROCEDURE usp_ProjectSearch(@Contains nvarchar(500),  @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Projects.ProjectID
	, ISNULL(ProjectUserLanguage.Name,ISNULL(ProjectDefaultLanguage.Name,'No name for this Project')) ProjectName
	, ISNULL(ProjectUserLanguage.Description,ISNULL(ProjectDefaultLanguage.Description,'No description for this Project')) ProjectDescription
	, Persons.FirstName + ' ' + Persons.LastName CreatorName
	, Persons.PersonID CreatorId
	, Projects.CreatedDate

FROM 
	Projects
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID, FullText FROM ProjectLanguages WHERE LanguageId = @LanguageID AND FREETEXT(ProjectLanguages.Fulltext, @Contains)) ProjectUserLanguage
	ON ProjectUserLanguage.ProjectID= Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID, FullText FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 AND FREETEXT(ProjectLanguages.Fulltext, @Contains)) ProjectDefaultLanguage
	ON ProjectDefaultLanguage.ProjectId = Projects.ProjectID
JOIN Persons 
	ON Persons.UserID = Projects.CreatorID
WHERE ProjectUserLanguage.ProjectID IS NOT NULL AND ProjectDefaultLanguage.ProjectID IS NOT NULL