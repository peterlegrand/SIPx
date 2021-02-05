CREATE PROCEDURE usp_ProcessSearch(@Contains nvarchar(500),  @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Processes.ProcessID
	, SubjectField.StringValue Subject
	, ISNULL(TemplateUserLanguage.Name,ISNULL(TemplateDefaultLanguage.Name,'No name for this classification')) ProcessTypeName
	, ISNULL(StageUserLanguage.Name,ISNULL(StageDefaultLanguage.Name,'No name for this classification')) ProcessTypeStageName
	, trim('/images/icons/' + ProcessTypeIcon.FileName) ProcessTypeIcon
	, ProcessTypeStageTypes.Color ProcessTypeStageTypeColor
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Processes.CreatedDate
FROM 
	Processes
JOIN Processfields SubjectField
	ON Processes.ProcessID = SubjectField.ProcessID
JOIN ProcessTypeFields SubjectTemplate

	ON SubjectTemplate.ProcessTypeFieldID = SubjectField.ProcessTypeFieldID
JOIN ProcessTypes 
	ON ProcessTypes.ProcessTypeID = Processes.ProcessTypeID
JOIN Icons ProcessTypeIcon
	ON ProcessTypeIcon.IconId = ProcessTypes.IconID
JOIN processtypestages 
	ON processtypestages.ProcessTypeStageID = Processes.ProcessTypeStageID
JOIN ProcessTypeStageTypes 
	ON ProcessTypeStageTypes.ProcessTypeStageTypeID = processtypestages.ProcessTypeStageTypeID 
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) TemplateUserLanguage
	ON TemplateUserLanguage.ProcessTypeID= Processes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) TemplateDefaultLanguage
	ON TemplateDefaultLanguage.ProcessTypeId = Processes.ProcessTypeID

LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) StageUserLanguage
	ON StageUserLanguage.ProcessTypeStageID= Processes.ProcessTypeStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageDefaultLanguage
	ON StageDefaultLanguage.ProcessTypeStageId = Processes.ProcessTypeStageID
JOIN Persons Creator
	ON Creator.UserId = Processes.CreatorID
WHERE Processes.ProcessId IN (SELECT ProcessId FROM PRocessFields WHERE Freetext(StringValue , @Contains))
	AND SubjectTemplate.ProcessTypeFieldTypeID = 1