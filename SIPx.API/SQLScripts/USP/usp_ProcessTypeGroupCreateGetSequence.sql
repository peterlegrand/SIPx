CREATE PROCEDURE [dbo].[usp_ProcessTypeGroupCreateGetSequence] (@UserID nvarchar(450)) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	Sequence
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this process TemplateGroup')) Name
FROM ProcessTypeGroups
LEFT JOIN (SELECT ProcessTypeGroupID, Name FROM ProcessTypeGroupLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTypeGroupID= ProcessTypeGroups.ProcessTypeGroupID
LEFT JOIN (SELECT ProcessTypeGroupId, Name FROM ProcessTypeGroupLanguages JOIN Settings ON ProcessTypeGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTypeGroupID = ProcessTypeGroups.ProcessTypeGroupID
ORDER BY Sequence
END