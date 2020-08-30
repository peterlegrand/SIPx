CREATE PROCEDURE [dbo].[usp_ContentTypeGroupLanguageUpdateGet] (@ContentTypeGroupLanguageId int) 
AS 
SELECT ContentTypeGroups.ContentTypeGroupId 
	, ContentTypeGroupLanguages.ContentTypeGroupLanguageID
	, ContentTypeGroupLanguages.LanguageID
	, ContentTypeGroupLanguages.Name
	, ContentTypeGroupLanguages.Description
	, ContentTypeGroupLanguages.MenuName
	, ContentTypeGroupLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypeGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypeGroupLanguages.ModifiedDate
FROM ContentTypeGroups
JOIN ContentTypeGroupLanguages
	ON ContentTypeGroups.ContentTypeGroupId = ContentTypeGroupLanguages.ContentTypeGroupID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeGroupLanguages.ModifierID
WHERE ContentTypeGroupLanguages.ContentTypeGroupLanguageId = @ContentTypeGroupLanguageID

