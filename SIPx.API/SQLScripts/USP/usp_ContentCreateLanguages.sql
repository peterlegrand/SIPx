CREATE PROCEDURE [dbo].[usp_ContentCreateLanguages] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;

DECLARE @SecurityLevelID int;
SELECT @SecurityLevelID = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;

SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Languages.LanguageID
	, ISNULL(Customization,Name ) Name 
FROM Languages 
JOIN UITermLanguages ON Languages.NameTermID = UITermLanguages.UITermID
LEFT JOIN (SELECT UITermLanguageCustomizations.UITermID, UITermLanguageCustomizations.Customization FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID) Customization
	ON Customization.UITermID = Languages.NameTermID
WHERE Languages.StatusID = 1 AND UITermLanguages.LanguageID = @LanguageID
ORDER BY Name
