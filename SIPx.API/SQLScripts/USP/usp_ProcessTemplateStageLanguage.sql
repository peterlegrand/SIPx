CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageLanguage] (@UserID nvarchar(450), @ProcessTemplateStageLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ProcessTemplateStageLanguages.ProcessTemplateStageLanguageID
	, ProcessTemplateStageLanguages.LanguageID
	, ProcessTemplateStageLanguages.Name
	, ProcessTemplateStageLanguages.Description
	, ProcessTemplateStageLanguages.MenuName
	, ProcessTemplateStageLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateStageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStageLanguages.ModifiedDate
FROM ProcessTemplateStages
JOIN ProcessTemplateStageLanguages
	ON ProcessTemplateStages.ProcessTemplateStageID = ProcessTemplateStageLanguages.ProcessTemplateStageID
JOIN Languages 
	ON Languages.LanguageID = ProcessTemplateStageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateStageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStageLanguages.ModifierID
WHERE ProcessTemplateStageLanguages.ProcessTemplateStageLanguageID = @ProcessTemplateStageLanguageID
	AND UILanguageName.LanguageID = @LanguageID
