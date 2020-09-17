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
	, trim('/images/icons/' + ProcessTemplateIcon.FileName) ProcessTemplateIcon
	, ProcessTemplateStageTypes.Color ProcessTemplateStageTypeColor
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Processes.CreatedDate
FROM 
	Processes
JOIN Processfields SubjectField
	ON Processes.ProcessID = SubjectField.ProcessID
JOIN ProcessTemplateFields SubjectTemplate

	ON SubjectTemplate.ProcessTemplateFieldID = SubjectField.ProcessTemplateFieldID
JOIN ProcessTemplates 
	ON ProcessTemplates.ProcessTemplateID = Processes.ProcessTemplateID
JOIN Icons ProcessTemplateIcon
	ON ProcessTemplateIcon.IconId = ProcessTemplates.IconID
JOIN processtemplatestages 
	ON processtemplatestages.ProcessTemplateStageID = Processes.ProcessTemplateStageID
JOIN ProcessTemplateStageTypes 
	ON ProcessTemplateStageTypes.ProcessTemplateStageTypeID = processtemplatestages.ProcessTemplateStageTypeID 
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
WHERE Processes.ProcessId IN (SELECT ProcessId FROM PRocessFields WHERE Freetext(StringValue , @Contains))
	AND SubjectTemplate.ProcessTemplateFieldTypeID = 1