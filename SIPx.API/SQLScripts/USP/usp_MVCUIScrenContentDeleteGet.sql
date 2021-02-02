CREATE PROCEDURE usp_MVCUIScrenContentDeleteGet (@UserId nvarchar(450),@MetaContentId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'MetaContent', 'Edit',1,'',@MetaContentId,@UserId


SELECT MetaContents.MetaContentID
	, Contents.Title
	, ISNULL(UINameCustom.Customization ,UIName.Name) MetaContentTypeName
	, ISNULL(UIContentLanguageNameCustom.Customization ,UIContentLanguageName.Name) UIContentLanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, MetaContents.CreatedDate
FROM MetaContents 
JOIN Contents	
	ON MetaContents.ContentId = Contents.ContentID
JOIN MetaContentTypes  
	ON MetaContentTypes.MetaContentTypeID = MetaContents.MetaContentTypeId
JOIN UITermLanguages UIName
	ON UIName.UITermId = MetaContentTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = MetaContentTypes.NameTermID
JOIN Languages Contentlanguage
	ON Contentlanguage.LanguageID = Contents.LanguageID
JOIN UITermLanguages UIContentLanguageName
	ON UIName.UITermId = Contentlanguage.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIContentLanguageNameCustom
	ON UINameCustom.UITermId = Contentlanguage.NameTermID

JOIN Persons Creator
	ON Creator.UserId = MetaContents.CreatorID
WHERE UIName.LanguageId = @LanguageID
	AND MetaContents.MetaTypeId = 1
	AND MetaContents.MetaContentId = @MetaContentId

COMMIT TRANSACTION