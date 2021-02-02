CREATE PROCEDURE usp_MetaContentDeleteGet (@UserId nvarchar(450), @MetaContentId int) 
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
 	, ISNULL(MetaTypeNameCustom.Customization,MetaTypeName.Name) MetaTypeName
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

JOIN MetaTypes
	ON MetaTypes.MetaTypeId = MetaContents.MetaTypeId
JOIN UITermLanguages MetaTypeName
	ON MetaTypeName.UITermId = MetaTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) MetaTypeNameCustom
	ON MetaTypeNameCustom.UITermId = MetaTypes.NameTermID


JOIN Languages 
	ON Languages.LanguageId = Contents.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = MetaContents.CreatorID
WHERE MetaContents.MetaContentId= @MetaContentId
	AND MetaContentTypeName.LanguageID= @LanguageID
	AND UILanguageName.LanguageID = @LanguageId
	AND Contents.LanguageID= @LanguageID
ORDER BY  	ISNULL(MetaContentTypeNameCustom.Customization,MetaContentTypeName.Name) 