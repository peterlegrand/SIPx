CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateGroups.ProcessTemplateGroupID
	, ISNULL(UserProcessTemplateGroupLanguage.Name,ISNULL(DefaultProcessTemplateGroupLanguage.Name,'No name for this group')) Name
FROM ProcessTemplateGroups
LEFT JOIN (SELECT ProcessTemplateGroupId, Name, Description, MenuName, MouseOver FROM ProcessTemplateGroupLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateGroupLanguage
	ON UserProcessTemplateGroupLanguage.ProcessTemplateGroupId = ProcessTemplateGroups.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateGroupId, Name, Description, MenuName, MouseOver FROM ProcessTemplateGroupLanguages JOIN Settings ON ProcessTemplateGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateGroupLanguage
	ON DefaultProcessTemplateGroupLanguage.ProcessTemplateGroupId = ProcessTemplateGroups.ProcessTemplateGroupID
ORDER BY ISNULL(UserProcessTemplateGroupLanguage.Name,ISNULL(DefaultProcessTemplateGroupLanguage.Name,'No name for this group'))
