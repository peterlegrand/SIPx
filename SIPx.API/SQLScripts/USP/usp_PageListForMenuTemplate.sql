CREATE PROCEDURE usp_PageListForMenuTemplate (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Pages.PageID, Name	
FROM Pages 
JOIN PageLanguages
	ON Pages.PageID = PageLanguages.PageID
WHERE PageLanguages.LanguageID = @LanguageId
	AND Pages.UserID IS NULL