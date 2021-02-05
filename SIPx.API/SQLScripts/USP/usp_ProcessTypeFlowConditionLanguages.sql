CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionLanguages] (@UserId nvarchar(450), @ProcessTypeFlowConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeFlowConditionLanguages.ProcessTypeFlowConditionLanguageID
	, ProcessTypeFlowConditionLanguages.LanguageID
	, ProcessTypeFlowConditionLanguages.Name
	, ProcessTypeFlowConditionLanguages.Description
	, ProcessTypeFlowConditionLanguages.MenuName
	, ProcessTypeFlowConditionLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeFlowConditionLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTypeFlowConditionLanguages.ModifiedDate
FROM ProcessTypeFlowConditions
JOIN ProcessTypeFlowConditionLanguages
	ON ProcessTypeFlowConditions.ProcessTypeFlowConditionId = ProcessTypeFlowConditionLanguages.ProcessTypeFlowConditionID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeFlowConditionLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlowConditionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlowConditionLanguages.ModifierID
WHERE ProcessTypeFlowConditions.ProcessTypeFlowConditionId = @ProcessTypeFlowConditionID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
