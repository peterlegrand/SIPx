CREATE PROCEDURE [dbo].[usp_ProcessTemplateLanguage] (@UserID nvarchar(450), @ProcessTemplateLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ProcessTemplateLanguages.ProcessTemplateLanguageID
	, ProcessTemplateLanguages.LanguageID
	, ProcessTemplateLanguages.Name
	, ProcessTemplateLanguages.Description
	, ProcessTemplateLanguages.MenuName
	, ProcessTemplateLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateLanguages.ModifiedDate
FROM ProcessTemplates
JOIN ProcessTemplateLanguages
	ON ProcessTemplates.ProcessTemplateID = ProcessTemplateLanguages.ProcessTemplateID
JOIN Languages 
	ON Languages.LanguageID = ProcessTemplateLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateLanguages.ModifierID
WHERE ProcessTemplateLanguages.ProcessTemplateLanguageID = @ProcessTemplateLanguageID
	AND UILanguageName.LanguageID = @LanguageID
