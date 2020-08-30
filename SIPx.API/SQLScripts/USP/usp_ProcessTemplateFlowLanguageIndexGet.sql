CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguageIndexGet] (@UserId nvarchar(450), @ProcessTemplateFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateFlowLanguages.ProcessTemplateFlowLanguageID
	, ProcessTemplateFlowLanguages.LanguageID
	, ProcessTemplateFlowLanguages.Name
	, ProcessTemplateFlowLanguages.Description
	, ProcessTemplateFlowLanguages.MenuName
	, ProcessTemplateFlowLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateFlowLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTemplateFlowLanguages.ModifiedDate
FROM ProcessTemplateFlows
JOIN ProcessTemplateFlowLanguages
	ON ProcessTemplateFlows.ProcessTemplateFlowId = ProcessTemplateFlowLanguages.ProcessTemplateFlowID
JOIN Languages 
	ON Languages.LanguageId = ProcessTemplateFlowLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFlowLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFlowLanguages.ModifierID
WHERE ProcessTemplateFlows.ProcessTemplateFlowId = @ProcessTemplateFlowID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
