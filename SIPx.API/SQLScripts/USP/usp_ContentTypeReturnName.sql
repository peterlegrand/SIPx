CREATE PROCEDURE usp_ContentTypeReturnName (@UserId nvarchar(450), @ContentTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
IF @ContentTypeId = 0
BEGIN
SELECT ISNULL(UINameCustom.Customization ,UIName.Name) ContentTypeName
FROM UITerms 
JOIN UITermLanguages UIName
	ON UIName.UITermId = UITerms.UITermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = UITerms.UITermID
WHERE UIName.LanguageId = @LanguageID
	AND UITerms.InternalName = 'No parent'
END
ELSE
BEGIN
SELECT  ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this role')) ContentTypeName
FROM ContentTypes 
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
WHERE ContentTypes.ContentTypeId = @ContentTypeID
END