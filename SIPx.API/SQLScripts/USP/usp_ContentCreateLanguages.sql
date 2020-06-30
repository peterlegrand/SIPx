CREATE PROCEDURE [dbo].[usp_ContentCreateLanguages] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;

DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;

SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT Languages.LanguageID
	, ISNULL(Customization,Name ) Name 
FROM Languages 
JOIN UITermLanguages ON Languages.NameTermId = UITermLanguages.UITermID
LEFT JOIN (SELECT UITermLanguageCustomizations.UITermId, UITermLanguageCustomizations.Customization FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID) Customization
	ON Customization.UITermId = Languages.NameTermID
WHERE Languages.StatusId = 1 AND UITermLanguages.LanguageId = @LanguageID
ORDER BY Name
