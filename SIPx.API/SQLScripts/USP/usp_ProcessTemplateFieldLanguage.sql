CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldLanguage] (@UserID nvarchar(450), @ProcessTemplateFieldLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ProcessTemplateFieldLanguages.ProcessTemplateFieldLanguageID
	, ProcessTemplateFieldLanguages.LanguageID
	, ProcessTemplateFieldLanguages.Name
	, ProcessTemplateFieldLanguages.Description
	, ProcessTemplateFieldLanguages.MenuName
	, ProcessTemplateFieldLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFieldLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFieldLanguages.ModifiedDate
FROM ProcessTemplateFields
JOIN ProcessTemplateFieldLanguages
	ON ProcessTemplateFields.ProcessTemplateFieldID = ProcessTemplateFieldLanguages.ProcessTemplateFieldID
JOIN Languages 
	ON Languages.LanguageID = ProcessTemplateFieldLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFieldLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFieldLanguages.ModifierID
WHERE ProcessTemplateFieldLanguages.ProcessTemplateFieldLanguageID = @ProcessTemplateFieldLanguageID
	AND UILanguageName.LanguageID = @LanguageID
