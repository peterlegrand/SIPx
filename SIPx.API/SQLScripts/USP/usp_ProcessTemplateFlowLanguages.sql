CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguages] (@UserID nvarchar(450), @ProcessTemplateFlowID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ProcessTemplateFlowLanguages.ProcessTemplateFlowLanguageID
	, ProcessTemplateFlowLanguages.LanguageID
	, ProcessTemplateFlowLanguages.Name
	, ProcessTemplateFlowLanguages.Description
	, ProcessTemplateFlowLanguages.MenuName
	, ProcessTemplateFlowLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFlowLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFlowLanguages.ModifiedDate
FROM ProcessTemplateFlows
JOIN ProcessTemplateFlowLanguages
	ON ProcessTemplateFlows.ProcessTemplateFlowID = ProcessTemplateFlowLanguages.ProcessTemplateFlowID
JOIN Languages 
	ON Languages.LanguageID = ProcessTemplateFlowLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFlowLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFlowLanguages.ModifierID
WHERE ProcessTemplateFlows.ProcessTemplateFlowID = @ProcessTemplateFlowID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
