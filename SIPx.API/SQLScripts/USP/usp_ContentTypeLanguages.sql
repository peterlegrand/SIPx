CREATE PROCEDURE [dbo].[usp_ContentTypeLanguages] (@UserID nvarchar(450), @ContentTypeID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ContentTypes.ContentTypeID 
	, ContentTypeLanguages.ContentTypeLanguageID
	, ContentTypeLanguages.LanguageID
	, ContentTypeLanguages.Name
	, ContentTypeLanguages.Description
	, ContentTypeLanguages.MenuName
	, ContentTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ContentTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypeLanguages.ModifiedDate
FROM ContentTypes
JOIN ContentTypeLanguages
	ON ContentTypes.ContentTypeID = ContentTypeLanguages.ContentTypeID
JOIN Languages 
	ON Languages.LanguageID = ContentTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ContentTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypeLanguages.ModifierID
WHERE ContentTypeLanguages.ContentTypeID = @ContentTypeID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)

