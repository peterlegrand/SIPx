CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupLanguageUpdateGet] (@UserId nvarchar(450), @ProcessTemplateGroupLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateGroupLanguages.ProcessTemplateGroupLanguageID
	, ProcessTemplateGroupLanguages.LanguageID
	, ProcessTemplateGroupLanguages.Name
	, ProcessTemplateGroupLanguages.Description
	, ProcessTemplateGroupLanguages.MenuName
	, ProcessTemplateGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTemplateGroupLanguages.ModifiedDate
FROM ProcessTemplateGroups
JOIN ProcessTemplateGroupLanguages
	ON ProcessTemplateGroups.ProcessTemplateGroupId = ProcessTemplateGroupLanguages.ProcessTemplateGroupID
JOIN Languages 
	ON Languages.LanguageId = ProcessTemplateGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateGroupLanguages.ModifierID
WHERE ProcessTemplateGroupLanguages.ProcessTemplateGroupLanguageId = @ProcessTemplateGroupLanguageID
	AND UILanguageName.LanguageId = @LanguageID
