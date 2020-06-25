CREATE PROCEDURE [dbo].[usp_ProjectLanguage] (@UserID nvarchar(450), @ProjectLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT  ProjectLanguages.ProjectLanguageID
	, ProjectLanguages.LanguageID
	, ProjectLanguages.Name
	, ProjectLanguages.Description
	, ProjectLanguages.MenuName
	, ProjectLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProjectLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProjectLanguages.ModifiedDate
FROM Projects
JOIN ProjectLanguages
	ON Projects.ProjectID = ProjectLanguages.ProjectID
JOIN Languages 
	ON Languages.LanguageID = ProjectLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProjectLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProjectLanguages.ModifierID
WHERE ProjectLanguages.ProjectLanguageID = @ProjectLanguageID
	AND UILanguageName.LanguageID = @LanguageID
