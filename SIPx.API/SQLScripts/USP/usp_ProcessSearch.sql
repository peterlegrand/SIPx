CREATE PROCEDURE usp_ProcessSearch(@Contains nvarchar(500),  @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Processes.ProcessID
	, SubjectField.StringValue Subject
	, ISNULL(TemplateUserLanguage.Name,ISNULL(TemplateDefaultLanguage.Name,'No name for this classification')) ProcessTemplateName
	, ISNULL(StageUserLanguage.Name,ISNULL(StageDefaultLanguage.Name,'No name for this classification')) ProcessTemplateStageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Processes.CreatedDate
FROM 
	Processes
JOIN Processfields SubjectField
	ON Processes.ProcessID = SubjectField.ProcessID
JOIN ProcessTemplateFields SubjectTemplate
	ON SubjectTemplate.ProcessTemplateFieldID = SubjectField.ProcessTemplateFieldID

LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) TemplateUserLanguage
	ON TemplateUserLanguage.ProcessTemplateID= Processes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) TemplateDefaultLanguage
	ON TemplateDefaultLanguage.ProcessTemplateId = Processes.ProcessTemplateID

LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages WHERE LanguageId = @LanguageID) StageUserLanguage
	ON StageUserLanguage.ProcessTemplateStageID= Processes.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageDefaultLanguage
	ON StageDefaultLanguage.ProcessTemplateStageId = Processes.ProcessTemplateStageID
JOIN Persons Creator
	ON Creator.UserId = Processes.CreatorID
WHERE Processes.ProcessId IN (SELECT ProcessId FROM PRocessFields WHERE CONTAINS (StringValue , @Contains))
	AND SubjectTemplate.ProcessTemplateFieldTypeID = 1