CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguages] (@UserId nvarchar(450), @ProcessTemplateFlowConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateFlowConditionLanguages.ProcessTemplateFlowConditionLanguageID
	, ProcessTemplateFlowConditionLanguages.LanguageID
	, ProcessTemplateFlowConditionLanguages.Name
	, ProcessTemplateFlowConditionLanguages.Description
	, ProcessTemplateFlowConditionLanguages.MenuName
	, ProcessTemplateFlowConditionLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFlowConditionLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFlowConditionLanguages.ModifiedDate
FROM ProcessTemplateFlowConditions
JOIN ProcessTemplateFlowConditionLanguages
	ON ProcessTemplateFlowConditions.ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionLanguages.ProcessTemplateFlowConditionID
JOIN Languages 
	ON Languages.LanguageId = ProcessTemplateFlowConditionLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFlowConditionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFlowConditionLanguages.ModifierID
WHERE ProcessTemplateFlowConditions.ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
