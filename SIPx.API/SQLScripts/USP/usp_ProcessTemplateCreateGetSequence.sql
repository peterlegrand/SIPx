CREATE PROCEDURE [dbo].[usp_ProcessTemplateCreateGetSequence] (@UserID nvarchar(450)) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	Sequence
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this process template')) Name
FROM ProcessTemplates
LEFT JOIN (SELECT ProcessTemplateID, Name FROM ProcessTemplateLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTemplateID = ProcessTemplates.ProcessTemplateID
ORDER BY Sequence
END