CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeLanguages] (@UserId nvarchar(450), @ProcessTemplateStageTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeLanguageID
	, ProcessTemplateStageTypeLanguages.LanguageID
	, ProcessTemplateStageTypeLanguages.Name
	, ProcessTemplateStageTypeLanguages.Description
	, ProcessTemplateStageTypeLanguages.MenuName
	, ProcessTemplateStageTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateStageTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStageTypeLanguages.ModifiedDate
FROM ProcessTemplateStageTypes
JOIN ProcessTemplateStageTypeLanguages
	ON ProcessTemplateStageTypes.ProcessTemplateStageTypeId = ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeID
JOIN Languages 
	ON Languages.LanguageId = ProcessTemplateStageTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateStageTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateStageTypeLanguages.ModifierID
WHERE ProcessTemplateStageTypes.ProcessTemplateStageTypeId = @ProcessTemplateStageTypeID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
