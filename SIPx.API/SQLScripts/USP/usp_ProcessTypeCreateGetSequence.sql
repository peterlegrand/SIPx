CREATE PROCEDURE [dbo].[usp_ProcessTypeCreateGetSequence] (@UserID nvarchar(450)) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	Sequence
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this process type')) Name
FROM ProcessTypes
LEFT JOIN (SELECT ProcessTypeID, Name FROM ProcessTypeLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTypeID= ProcessTypes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTypeID = ProcessTypes.ProcessTypeID
ORDER BY Sequence
END