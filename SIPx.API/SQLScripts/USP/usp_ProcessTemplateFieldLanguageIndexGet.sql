CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldLanguageIndexGet] (@UserId nvarchar(450), @ProcessTemplateFieldId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateFieldLanguages.ProcessTemplateFieldLanguageID
	, ProcessTemplateFieldLanguages.LanguageID
	, ProcessTemplateFieldLanguages.Name
	, ProcessTemplateFieldLanguages.Description
	, ProcessTemplateFieldLanguages.MenuName
	, ProcessTemplateFieldLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateFieldLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTemplateFieldLanguages.ModifiedDate
FROM ProcessTemplateFields
JOIN ProcessTemplateFieldLanguages
	ON ProcessTemplateFields.ProcessTemplateFieldId = ProcessTemplateFieldLanguages.ProcessTemplateFieldID
JOIN Languages 
	ON Languages.LanguageId = ProcessTemplateFieldLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFieldLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFieldLanguages.ModifierID
WHERE ProcessTemplateFields.ProcessTemplateFieldId = @ProcessTemplateFieldID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
