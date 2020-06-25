CREATE PROCEDURE [dbo].[usp_ContentTypeGroupLanguages] (@UserID nvarchar(450), @ContentTypeGroupID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ContentTypeGroupLanguages.ContentTypeGroupLanguageID
	, ContentTypeGroupLanguages.LanguageID
	, ContentTypeGroupLanguages.Name
	, ContentTypeGroupLanguages.Description
	, ContentTypeGroupLanguages.MenuName
	, ContentTypeGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ContentTypeGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypeGroupLanguages.ModifiedDate
FROM ContentTypeGroups
JOIN ContentTypeGroupLanguages
	ON ContentTypeGroups.ContentTypeGroupID = ContentTypeGroupLanguages.ContentTypeGroupID
JOIN Languages 
	ON Languages.LanguageID = ContentTypeGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ContentTypeGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypeGroupLanguages.ModifierID
WHERE ContentTypeGroups.ContentTypeGroupID = @ContentTypeGroupID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
