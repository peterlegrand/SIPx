CREATE PROCEDURE usp_MetaContentCreateGetMetaContentTypeList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	MetaContentTypes.MetaContentTypeID
	, ISNULL(MetaContentTypeNameCustom.Customization,MetaContentTypeLanguage.Name) Name
FROM MetaContentTypes 
JOIN UITermLanguages MetaContentTypeLanguage 
	ON MetaContentTypes.NameTermId = MetaContentTypeLanguage.UITermId 
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) MetaContentTypeNameCustom
	ON MetaContentTypeNameCustom.UITermId = MetaContentTypes.NameTermID
WHERE MetaContentTypeLanguage.LanguageId =@LanguageId
ORDER BY ISNULL(MetaContentTypeNameCustom.Customization,MetaContentTypeLanguage.Name)


