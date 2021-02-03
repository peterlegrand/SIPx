CREATE PROCEDURE usp_ContentTypeUpdateGet (@UserId nvarchar(450), @ContentTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypes.ContentTypeID
	, ContentTypes.CodePrefix
	, ContentTypes.CodeSuffix
	, ContentTypes.CodeTypeId
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserContentTypeLanguage.Description,ISNULL(DefaultContentTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserContentTypeLanguage.MenuName,ISNULL(DefaultContentTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserContentTypeLanguage.MouseOver,ISNULL(DefaultContentTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, IconID
	, Color
	, HasAnyChildContentType
	, HasAnyMatrixContentType
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypes.ModifiedDate
FROM ContentTypes 
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
JOIN Persons Creator
	ON Creator.UserId = ContentTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypes.ModifierID
WHERE ContentTypes.ContentTypeId = @ContentTypeID
