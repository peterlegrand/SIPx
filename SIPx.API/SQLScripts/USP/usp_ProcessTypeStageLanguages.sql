CREATE PROCEDURE [dbo].[usp_ProcessTypeStageLanguages] (@UserId nvarchar(450), @ProcessTypeStageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeStageLanguages.ProcessTypeStageLanguageID
	, ProcessTypeStageLanguages.LanguageID
	, ProcessTypeStageLanguages.Name
	, ProcessTypeStageLanguages.Description
	, ProcessTypeStageLanguages.MenuName
	, ProcessTypeStageLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeStageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTypeStageLanguages.ModifiedDate
FROM ProcessTypeStages
JOIN ProcessTypeStageLanguages
	ON ProcessTypeStages.ProcessTypeStageId = ProcessTypeStageLanguages.ProcessTypeStageID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeStageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeStageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeStageLanguages.ModifierID
WHERE ProcessTypeStages.ProcessTypeStageId = @ProcessTypeStageID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
