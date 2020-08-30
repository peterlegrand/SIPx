CREATE PROCEDURE [dbo].[usp_ContentTypeLanguageIndexGet] (@UserId nvarchar(450), @ContentTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ContentTypes.ContentTypeId 
	, ContentTypeLanguages.ContentTypeLanguageID
	, ContentTypeLanguages.LanguageID
	, ContentTypeLanguages.Name
	, ContentTypeLanguages.Description
	, ContentTypeLanguages.MenuName
	, ContentTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypeLanguages.ModifiedDate
FROM ContentTypes
JOIN ContentTypeLanguages
	ON ContentTypes.ContentTypeId = ContentTypeLanguages.ContentTypeID
JOIN Languages 
	ON Languages.LanguageId = ContentTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeLanguages.ModifierID
WHERE ContentTypeLanguages.ContentTypeId = @ContentTypeID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)

