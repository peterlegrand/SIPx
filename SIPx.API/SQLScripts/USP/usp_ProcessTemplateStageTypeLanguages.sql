CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeLanguages] (@UserID nvarchar(450), @ProcessTemplateStageTypeID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON ProcessTemplateStageTypes.ProcessTemplateStageTypeID = ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeID
JOIN Languages 
	ON Languages.LanguageID = ProcessTemplateStageTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateStageTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStageTypeLanguages.ModifierID
WHERE ProcessTemplateStageTypes.ProcessTemplateStageTypeID = @ProcessTemplateStageTypeID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
