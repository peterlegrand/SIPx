CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguageUpdateGet] (@UserId nvarchar(450), @ProcessTemplateFlowLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateFlows.ProcessTemplateFlowId 
	, ProcessTemplateFlowLanguages.ProcessTemplateFlowLanguageID
	, ProcessTemplateFlowLanguages.LanguageID
	, ProcessTemplateFlowLanguages.Name
	, ProcessTemplateFlowLanguages.Description
	, ProcessTemplateFlowLanguages.MenuName
	, ProcessTemplateFlowLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ProcessTemplateFlowLanguages.CreatorID
	, ProcessTemplateFlowLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ProcessTemplateFlowLanguages.ModifierID
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
WHERE ProcessTemplateFlowLanguages.ProcessTemplateFlowLanguageId = @ProcessTemplateFlowLanguageID
	AND UILanguageName.LanguageId = @LanguageID
