CREATE PROCEDURE usp_MVCUIScreenContentIndexGet (@UserId nvarchar(450), @MVCUIScreenId int ) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'MetaContent' AND Action = 'Index';
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogMetaContentList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

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
	AND MetaContents.MetaRecordId = @MVCUIScreenId
	AND MetaContents.MetaTypeId = 1
ORDER BY  	 ISNULL(UINameCustom.Customization ,UIName.Name) 
	, ISNULL(UIContentLanguageNameCustom.Customization ,UIContentLanguageName.Name) 

COMMIT TRANSACTION