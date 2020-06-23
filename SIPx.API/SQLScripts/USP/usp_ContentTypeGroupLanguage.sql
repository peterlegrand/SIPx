CREATE PROCEDURE [dbo].[usp_ContentTypeGroupLanguage] (@ContentTypeGroupLanguageID int) 
AS 
SELECT ContentTypeGroups.ContentTypeGroupID 
	, ContentTypeGroupLanguages.ContentTypeGroupLanguageID
	, ContentTypeGroupLanguages.LanguageID
	, ContentTypeGroupLanguages.Name
	, ContentTypeGroupLanguages.Description
	, ContentTypeGroupLanguages.MenuName
	, ContentTypeGroupLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ContentTypeGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypeGroupLanguages.ModifiedDate
FROM ContentTypeGroups
JOIN ContentTypeGroupLanguages
	ON ContentTypeGroups.ContentTypeGroupID = ContentTypeGroupLanguages.ContentTypeGroupID
JOIN Persons Creator
	ON Creator.UserID = ContentTypeGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypeGroupLanguages.ModifierID
WHERE ContentTypeGroupLanguages.ContentTypeGroupLanguageID = @ContentTypeGroupLanguageID

