CREATE PROCEDURE [dbo].[usp_ContentTypeLanguage] (@ContentTypeLanguageId int) 
AS 
SELECT ContentTypes.ContentTypeId 
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
	ON ContentTypes.ContentTypeId = ContentTypeLanguages.ContentTypeID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeLanguages.ModifierID
WHERE ContentTypeLanguages.ContentTypeLanguageId = @ContentTypeLanguageID

