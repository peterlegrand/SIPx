CREATE PROCEDURE [dbo].[usp_ProjectLanguageUpdateGet] (@UserId nvarchar(450), @ProjectLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT  ProjectLanguages.ProjectLanguageID
	, ProjectLanguages.LanguageID
	, ProjectLanguages.ProjectID
	, ProjectLanguages.Name
	, ProjectLanguages.Description
	, ProjectLanguages.MenuName
	, ProjectLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProjectLanguages.ModifiedDate
FROM Projects
JOIN ProjectLanguages
	ON Projects.ProjectId = ProjectLanguages.ProjectID
JOIN Languages 
	ON Languages.LanguageId = ProjectLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProjectLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectLanguages.ModifierID
WHERE ProjectLanguages.ProjectLanguageId = @ProjectLanguageID
	AND UILanguageName.LanguageId = @LanguageID
