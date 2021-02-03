CREATE PROCEDURE [dbo].[usp_ContentTypeIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ContentType' AND Action = 'Index';
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogContentTypeList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT ContentTypes.ContentTypeID
	, ISNULL(UserLanguage.ContentTypeLanguageID,ISNULL(DefaultLanguage.ContentTypeLanguageID,0)) ContentTypeLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ContentType')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this ContentType')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this ContentType')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this ContentType')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, CASE WHEN ContentTypes.DefaultPageId IS NULL THEN ISNULL(UserContentTypePageLanguage.Name,ISNULL(DefaultContentTypePageLanguage.Name,'No name for the default page')) ELSE 'There is no default page' END DefaultPageName
	, ContentTypes.DefaultPageID
	, ContentTypes.HasDropDown 
	, ContentTypes.DropDownSequence
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypes.ModifiedDate
FROM ContentTypes 
JOIN Statuses 
	ON Statuses.StatusId = ContentTypes.StatusID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypePageId, Name FROM ContentTypePageLanguages WHERE LanguageId = @LanguageID) UserContentTypePageLanguage
	ON UserContentTypePageLanguage.ContentTypePageId = ContentTypes.DefaultPageID
LEFT JOIN (SELECT ContentTypePageId, Name FROM ContentTypePageLanguages  JOIN Settings ON ContentTypePageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypePageLanguage
	ON DefaultContentTypePageLanguage.ContentTypePageId = ContentTypes.DefaultPageID
JOIN Persons Creator
	ON Creator.UserId = ContentTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypes.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE UIName.LanguageId = @LanguageID
	AND LanguageTerm.LanguageID = @LanguageId
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ContentType')) 



	COMMIT TRANSACTION