CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupLanguage] (@UserID nvarchar(450), @ProcessTemplateGroupLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ProcessTemplateGroupLanguages.ProcessTemplateGroupLanguageID
	, ProcessTemplateGroupLanguages.LanguageID
	, ProcessTemplateGroupLanguages.Name
	, ProcessTemplateGroupLanguages.Description
	, ProcessTemplateGroupLanguages.MenuName
	, ProcessTemplateGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateGroupLanguages.ModifiedDate
FROM ProcessTemplateGroups
JOIN ProcessTemplateGroupLanguages
	ON ProcessTemplateGroups.ProcessTemplateGroupID = ProcessTemplateGroupLanguages.ProcessTemplateGroupID
JOIN Languages 
	ON Languages.LanguageID = ProcessTemplateGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateGroupLanguages.ModifierID
WHERE ProcessTemplateGroupLanguages.ProcessTemplateGroupLanguageID = @ProcessTemplateGroupLanguageID
	AND UILanguageName.LanguageID = @LanguageID
