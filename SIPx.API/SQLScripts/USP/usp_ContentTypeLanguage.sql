CREATE PROCEDURE [dbo].[usp_ContentTypeLanguageUpdateGet] (@ContentTypeLanguageId int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = LanguageId FROM ContentTypeLanguages WHERE ContentTypeLanguages.ContentTypeLanguageID = @ContentTypeLanguageId
SELECT ContentTypes.ContentTypeId 
	, ContentTypeLanguages.ContentTypeLanguageID
	, ContentTypeLanguages.LanguageID
	, ContentTypeLanguages.Name
	, ContentTypeLanguages.Description
	, ContentTypeLanguages.MenuName
	, ContentTypeLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ContentTypeLanguages.CreatorID
	, ContentTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ContentTypeLanguages.ModifierID
	, ContentTypeLanguages.ModifiedDate
FROM ContentTypes
JOIN ContentTypeLanguages
	ON ContentTypes.ContentTypeId = ContentTypeLanguages.ContentTypeID
JOIN Languages 
	ON Languages.LanguageId = @LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeLanguages.ModifierID
WHERE ContentTypeLanguages.ContentTypeLanguageId = @ContentTypeLanguageID

