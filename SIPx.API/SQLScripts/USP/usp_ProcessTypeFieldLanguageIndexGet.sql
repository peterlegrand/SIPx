CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldLanguageIndexGet] (@UserId nvarchar(450), @ProcessTypeFieldId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeFieldLanguages.ProcessTypeFieldLanguageID
	, ProcessTypeFieldLanguages.LanguageID
	, ProcessTypeFieldLanguages.Name
	, ProcessTypeFieldLanguages.Description
	, ProcessTypeFieldLanguages.MenuName
	, ProcessTypeFieldLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeFieldLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeFieldLanguages.ModifiedDate
FROM ProcessTypeFields
JOIN ProcessTypeFieldLanguages
	ON ProcessTypeFields.ProcessTypeFieldId = ProcessTypeFieldLanguages.ProcessTypeFieldID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeFieldLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFieldLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFieldLanguages.ModifierID
WHERE ProcessTypeFields.ProcessTypeFieldId = @ProcessTypeFieldID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
