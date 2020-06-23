CREATE PROCEDURE [dbo].[usp_ContentTypeLanguage] (@ContentTypeLanguageID int) 
AS 
SELECT ContentTypes.ContentTypeID 
	, ContentTypeLanguages.ContentTypeLanguageID
	, ContentTypeLanguages.LanguageID
	, ContentTypeLanguages.Name
	, ContentTypeLanguages.Description
	, ContentTypeLanguages.MenuName
	, ContentTypeLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ContentTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypeLanguages.ModifiedDate
FROM ContentTypes
JOIN ContentTypeLanguages
	ON ContentTypes.ContentTypeID = ContentTypeLanguages.ContentTypeID
JOIN Persons Creator
	ON Creator.UserID = ContentTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypeLanguages.ModifierID
WHERE ContentTypeLanguages.ContentTypeLanguageID = @ContentTypeLanguageID

