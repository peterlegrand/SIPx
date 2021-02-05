CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowLanguage] (@UserId nvarchar(450), @ProcessTypeFlowLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeFlows.ProcessTypeFlowId 
	, ProcessTypeFlowLanguages.ProcessTypeFlowLanguageID
	, ProcessTypeFlowLanguages.LanguageID
	, ProcessTypeFlowLanguages.Name
	, ProcessTypeFlowLanguages.Description
	, ProcessTypeFlowLanguages.MenuName
	, ProcessTypeFlowLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeFlowLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTypeFlowLanguages.ModifiedDate
FROM ProcessTypeFlows
JOIN ProcessTypeFlowLanguages
	ON ProcessTypeFlows.ProcessTypeFlowId = ProcessTypeFlowLanguages.ProcessTypeFlowID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeFlowLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlowLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlowLanguages.ModifierID
WHERE ProcessTypeFlowLanguages.ProcessTypeFlowLanguageId = @ProcessTypeFlowLanguageID
	AND UILanguageName.LanguageId = @LanguageID
