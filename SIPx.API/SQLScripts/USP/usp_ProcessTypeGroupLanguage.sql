CREATE PROCEDURE [dbo].[usp_ProcessTypeGroupLanguage] (@UserId nvarchar(450), @ProcessTypeGroupLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeGroupLanguages.ProcessTypeGroupLanguageID
	, ProcessTypeGroupLanguages.LanguageID
	, ProcessTypeGroupLanguages.Name
	, ProcessTypeGroupLanguages.Description
	, ProcessTypeGroupLanguages.MenuName
	, ProcessTypeGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTypeGroupLanguages.ModifiedDate
FROM ProcessTypeGroups
JOIN ProcessTypeGroupLanguages
	ON ProcessTypeGroups.ProcessTypeGroupId = ProcessTypeGroupLanguages.ProcessTypeGroupID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeGroupLanguages.ModifierID
WHERE ProcessTypeGroupLanguages.ProcessTypeGroupLanguageId = @ProcessTypeGroupLanguageID
	AND UILanguageName.LanguageId = @LanguageID
