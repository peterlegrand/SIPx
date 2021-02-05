CREATE PROCEDURE [dbo].[usp_ProcessTypeLanguageIndexGet] (@UserId nvarchar(450), @ProcessTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeLanguages.ProcessTypeLanguageID
	, ProcessTypeLanguages.LanguageID
	, ProcessTypeLanguages.Name
	, ProcessTypeLanguages.Description
	, ProcessTypeLanguages.MenuName
	, ProcessTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeLanguages.ModifiedDate
FROM ProcessTypes
JOIN ProcessTypeLanguages
	ON ProcessTypes.ProcessTypeId = ProcessTypeLanguages.ProcessTypeID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeLanguages.ModifierID
WHERE ProcessTypes.ProcessTypeId = @ProcessTypeID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
