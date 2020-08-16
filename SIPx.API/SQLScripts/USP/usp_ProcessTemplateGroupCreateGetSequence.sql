CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupCreateGetSequence] (@UserID nvarchar(450)) 
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
FROM ProcessTemplateGroups
LEFT JOIN (SELECT ProcessTemplateGroupID, Name FROM ProcessTemplateGroupLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTemplateGroupID= ProcessTemplateGroups.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateGroupId, Name FROM ProcessTemplateGroupLanguages JOIN Settings ON ProcessTemplateGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTemplateGroupID = ProcessTemplateGroups.ProcessTemplateGroupID
ORDER BY Sequence
END