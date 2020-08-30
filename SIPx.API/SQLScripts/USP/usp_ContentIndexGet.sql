CREATE PROCEDURE [dbo].[usp_ContentIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
DECLARE @SeucurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT @SeucurityLevelId = SecurityLevelID FROM AspNetUsers WHERE Id = @UserId;
SELECT Contents.Title
	, ISNULL(ContentTypeLanguages.Name, 'No type name') ContentTypeName
	, ISNULL(CustomStatusLanguage.Customization, DefaultStatusLanguage.Name) ContentStatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Contents.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Contents.ModifiedDate
	, Modifier.PersonID ModifierId
FROM Contents
JOIN ContentTypeLanguages
	ON ContentTypeLanguages.ContentTypeID = Contents.ContentTypeID
JOIN ContentStatuses
	ON ContentStatuses.ContentStatusID = Contents.ContentStatusID
JOIN UITermLanguages DefaultStatusLanguage
	ON DefaultStatusLanguage.UITermID = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations WHERE LanguageID = @LanguageId) CustomStatusLanguage
	ON CustomStatusLanguage.UITermID = ContentStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID
WHERE DefaultStatusLanguage.LanguageID = @LanguageId
	AND (Contents.SecurityLevelID <= @SeucurityLevelId 
	OR Contents.CreatorID= @UserId)
ORDER BY Title
