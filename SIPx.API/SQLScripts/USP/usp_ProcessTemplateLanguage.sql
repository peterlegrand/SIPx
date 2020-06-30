CREATE PROCEDURE [dbo].[usp_ProcessTemplateLanguage] (@UserId nvarchar(450), @ProcessTemplateLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
	ON ProcessTemplates.ProcessTemplateId = ProcessTemplateLanguages.ProcessTemplateID
JOIN Languages 
	ON Languages.LanguageId = ProcessTemplateLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateLanguages.ModifierID
WHERE ProcessTemplateLanguages.ProcessTemplateLanguageId = @ProcessTemplateLanguageID
	AND UILanguageName.LanguageId = @LanguageID
