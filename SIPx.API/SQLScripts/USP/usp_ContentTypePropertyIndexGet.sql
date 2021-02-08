CREATE PROCEDURE usp_ContentTypePropertyIndexGet (@UserId nvarchar(450), @ContentTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ContentTypeProperty' AND Action = 'Index';

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogContentTypePropertyList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT ContentTypeProperties.ContentTypePropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypeProperties.ModifiedDate
FROM ContentTypeProperties 
JOIN Properties 
	ON ContentTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID



JOIN ObjectTypePropertyStatuses
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusID = ContentTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages UIName
	ON UIName.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ObjectTypePropertyStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeProperties.ModifierID
WHERE UIName.LanguageId = @LanguageID
	AND ContentTypeProperties.ContentTypeID= @ContentTypeId
ORDER BY  ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) 

COMMIT TRANSACTION