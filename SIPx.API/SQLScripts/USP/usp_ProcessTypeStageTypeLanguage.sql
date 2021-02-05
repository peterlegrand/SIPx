CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypeLanguage] (@UserId nvarchar(450), @ProcessTypeStageTypeLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeStageTypeLanguages.ProcessTypeStageTypeLanguageID
	, ProcessTypeStageTypeLanguages.LanguageID
	, ProcessTypeStageTypeLanguages.Name
	, ProcessTypeStageTypeLanguages.Description
	, ProcessTypeStageTypeLanguages.MenuName
	, ProcessTypeStageTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeStageTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTypeStageTypeLanguages.ModifiedDate
FROM ProcessTypeStageTypes
JOIN ProcessTypeStageTypeLanguages
	ON ProcessTypeStageTypes.ProcessTypeStageTypeId = ProcessTypeStageTypeLanguages.ProcessTypeStageTypeID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeStageTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeStageTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeStageTypeLanguages.ModifierID
WHERE ProcessTypeStageTypeLanguages.ProcessTypeStageTypeLanguageId = @ProcessTypeStageTypeLanguageID
	AND UILanguageName.LanguageId = @LanguageID
