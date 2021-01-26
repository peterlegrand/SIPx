CREATE PROCEDURE usp_MetaContentIndexGet (@UserId nvarchar(450), @MetaRecordId int, @MetaTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT MetaContents.MetaContentID
	, MetaContents.ContentId
	, MetaContents.MetaContentTypeId
	, Contents.Title
 	, ISNULL(MetaContentTypeNameCustom.Customization,MetaContentTypeName.Name) MetaContentTypeName
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, MetaContents.CreatedDate
FROM MetaContents 
JOIN  Contents	
	ON Contents.ContentID = MetaContents.ContentId
JOIN MetaContentTypes
	ON MetaContentTypes.MetaContentTypeId = MetaContents.MetaContentTypeId
JOIN UITermLanguages MetaContentTypeName
	ON MetaContentTypeName.UITermId = MetaContentTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) MetaContentTypeNameCustom
	ON MetaContentTypeNameCustom.UITermId = MetaContentTypes.NameTermID
JOIN Languages 
	ON Languages.LanguageId = Contents.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = MetaContents.CreatorID
WHERE MetaContents.MetaRecordId = @MetaRecordId
	AND MetaContentTypeName.LanguageID= @LanguageID
	AND UILanguageName.LanguageID = @LanguageId
	AND MetaContents.MetaTypeId = @MetaTypeId
	AND Contents.LanguageID= @LanguageID
ORDER BY  	ISNULL(MetaContentTypeNameCustom.Customization,MetaContentTypeName.Name) 