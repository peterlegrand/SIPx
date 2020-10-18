CREATE PROCEDURE usp_ContentTypeCreateGetProcessTemplates (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
ProcessTemplates.ProcessTemplateID
	, ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this ')) Name
	FROM ProcessTemplates 
LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateLanguage
	ON DefaultProcessTemplateLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateID

WHERE ProcessTemplates.ProcessTemplateID IN (select ProcessTemplateId from ProcessTemplateFields where processtemplatefields.ProcessTemplateFieldTypeID = 24)
ORDER BY 
	ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this ')) 
	