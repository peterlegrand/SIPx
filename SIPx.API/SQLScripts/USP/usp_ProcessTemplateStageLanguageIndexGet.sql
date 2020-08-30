CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageLanguageIndexGet] (@UserId nvarchar(450), @ProcessTemplateStageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateStageLanguages.ProcessTemplateStageLanguageID
	, ProcessTemplateStageLanguages.LanguageID
	, ProcessTemplateStageLanguages.Name
	, ProcessTemplateStageLanguages.Description
	, ProcessTemplateStageLanguages.MenuName
	, ProcessTemplateStageLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateStageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTemplateStageLanguages.ModifiedDate
FROM ProcessTemplateStages
JOIN ProcessTemplateStageLanguages
	ON ProcessTemplateStages.ProcessTemplateStageId = ProcessTemplateStageLanguages.ProcessTemplateStageID
JOIN Languages 
	ON Languages.LanguageId = ProcessTemplateStageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateStageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateStageLanguages.ModifierID
WHERE ProcessTemplateStages.ProcessTemplateStageId = @ProcessTemplateStageID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
