CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguage] (@UserID nvarchar(450), @ProcessTemplateFlowConditionLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID = ProcessTemplateFlowConditionLanguages.ProcessTemplateFlowConditionID
JOIN Languages 
	ON Languages.LanguageID = ProcessTemplateFlowConditionLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFlowConditionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFlowConditionLanguages.ModifierID
WHERE ProcessTemplateFlowConditionLanguages.ProcessTemplateFlowConditionLanguageID = @ProcessTemplateFlowConditionLanguageID
	AND UILanguageName.LanguageID = @LanguageID
