CREATE PROCEDURE [dbo].[usp_ContentTypeGroupLanguageIndexGet] (@UserId nvarchar(450), @ContentTypeGroupId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ContentTypeGroupLanguages.ContentTypeGroupLanguageID
	, ContentTypeGroupLanguages.LanguageID
	, ContentTypeGroupLanguages.Name
	, ContentTypeGroupLanguages.Description
	, ContentTypeGroupLanguages.MenuName
	, ContentTypeGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ContentTypeGroupLanguages.CreatorID
	, ContentTypeGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ContentTypeGroupLanguages.ModifierID
	, ContentTypeGroupLanguages.ModifiedDate
FROM ContentTypeGroups
JOIN ContentTypeGroupLanguages
	ON ContentTypeGroups.ContentTypeGroupId = ContentTypeGroupLanguages.ContentTypeGroupID
JOIN Languages 
	ON Languages.LanguageId = ContentTypeGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeGroupLanguages.ModifierID
WHERE ContentTypeGroups.ContentTypeGroupId = @ContentTypeGroupID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
