CREATE PROCEDURE usp_MVCUIScreenContentIndexGet (@UserId nvarchar(450), @MVCUIScreenId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @DefaultLanguageId int;
SELECT @DefaultLanguageId =  IntValue  FROM Settings WHERE Settings.SettingId = 1

SELECT Contents.ContentId
	, @LanguageId LanguageId
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Title
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, Contents.ModifiedDate
FROM MetaContents 
JOIN Contents
	ON MetaContents.ContentID = Contents.ContentID
JOIN Languages 
	ON Languages.LanguageId = Contents.LanguageId
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID
WHERE MetaContents.MetaRecordId = @MVCUIScreenId
	AND MetaTypeId = 1
	AND MetaContentTypeId = 1
	AND ( Contents.LanguageId = @LanguageId OR Contents.LanguageId = @DefaultLanguageId  )
	AND UILanguageName.LanguageID = @LanguageId
ORDER BY Title