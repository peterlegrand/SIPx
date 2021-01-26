CREATE PROCEDURE usp_ScreenHelp (@UserId nvarchar(450), @Controller varchar(100), @Action varchar(100))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @DefaultLanguageId int;
SELECT @DefaultLanguageId = IntValue FROM Settings WHERE SettingID = 1;

SELECT MetaContents.ContentId 
	
FROM MetaContents 
JOIN Contents	
	ON MetaContents.ContentId = Contents.ContentID
JOIN MVCUIScreens	
	ON MetaContents.MetaRecordId = MVCUIScreens.MVCUIScreenID
WHERE MetaContents.MetaContentTypeId =1
	AND MetaContents.MetaTypeId = 1
	AND Controller = @Controller 
	AND Action =  @Action
	AND ( Contents.LanguageID = @LanguageId OR Contents.LanguageID = @DefaultLanguageId)
ORDER BY CASE WHEN Contents.LanguageID = @LanguageId THEN 1 
	ELSE 2 END 

