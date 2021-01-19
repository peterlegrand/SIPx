CREATE PROCEDURE [dbo].[usp_ContentTypeGroupLanguageUpdateGet] (@UserId nvarchar(450)
	, @ContentTypeGroupLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ContentTypeGroupLanguage' AND Action = 'LanguageUpdate';
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ReadLogContentTypeGroupLanguageCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @ContentTypeGroupLanguageId, @UserId, Getdate(), @ScreenId)

SELECT ContentTypeGroupLanguages.ContentTypeGroupLanguageID
	, ContentTypeGroupLanguages.ContentTypeGroupID
	, ContentTypeGroupLanguages.LanguageID
	, UILanguageName.Name LanguageName
	, ContentTypeGroupLanguages.Name
	, ContentTypeGroupLanguages.Description
	, ContentTypeGroupLanguages.MenuName
	, ContentTypeGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypeGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypeGroupLanguages.ModifiedDate
FROM ContentTypeGroups
JOIN ContentTypeGroupLanguages
	ON ContentTypeGroups.ContentTypeGroupId = ContentTypeGroupLanguages.ContentTypeGroupID
JOIN Languages 
	ON Languages.LanguageId = ContentTypeGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeGroupLanguages.ModifierID
WHERE ContentTypeGroupLanguages.ContentTypeGroupLanguageId = @ContentTypeGroupLanguageID
	AND UILanguageName.LanguageId = @LanguageID

COMMIT TRANSACTION