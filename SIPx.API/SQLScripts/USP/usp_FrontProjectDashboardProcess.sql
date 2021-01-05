CREATE PROCEDURE usp_FrontProjectDashboardProcess (@UserId nvarchar(450), @ProjectId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelId
FROM AspNetUsers
WHERE Id = @UserID
;
SELECT Processes.ProcessID
	, SubjectField.StringValue Subject
	, ISNULL(UserProcessTemplateStageTypeLanguage.Name
		,ISNULL(DefaultProcessTemplateStageTypeLanguage.Name
			,'No name for this stage type')) ProcessTemplateStageTypeName
	, ISNULL(UserProcessTemplateLanguage.Name
		,ISNULL(DefaultProcessTemplateLanguage.Name
			,'No name for this process template')) ProcessTemplateName
	, ProcessTemplates.Color TemplateColor
	, ProcessTemplateStageTypes.Color StageTypeColor
	, StageTypeIcon.FileName StageTypeIconFileName
	, TemplateIcon.FileName TemplateIconFileName

FROM Processes
JOIN ProcessFields ProjectField
	ON Processes.ProcessID = ProjectField.ProcessID

JOIN ProcessTemplateFields	ProjectTemplateField
	ON ProjectTemplateField.ProcessTemplateFieldID = ProjectField.ProcessTemplateFieldID

JOIN ProcessFields SubjectField
	ON Processes.ProcessID = SubjectField.ProcessID

JOIN ProcessTemplateFields	SubjectTemplateField
	ON SubjectTemplateField.ProcessTemplateFieldID = SubjectField.ProcessTemplateFieldID

JOIN ProcessFields SecurityField
	ON Processes.ProcessID = SecurityField.ProcessID

JOIN ProcessTemplateFields	SecurityTemplateField
	ON SecurityTemplateField.ProcessTemplateFieldID = SecurityField.ProcessTemplateFieldID

JOIN ProcessTemplateStages
	ON Processes.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID

JOIN ProcessTemplateStageTypes
	ON ProcessTemplateStageTypes.ProcessTemplateStageTypeID = ProcessTemplateStages.ProcessTemplateStageTypeID
LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageTypeLanguage
	ON UserProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeID= ProcessTemplateStageTypes.ProcessTemplateStageTypeID
LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageTypeLanguage
	ON DefaultProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStageTypes.ProcessTemplateStageTypeID
JOIN Icons StageTypeIcon
	ON ProcessTemplateStageTypes.IconID = StageTypeIcon.IconId
JOIN ProcessTemplates 
	ON ProcessTemplates.ProcessTemplateID = Processes.ProcessTemplateID
JOIN Icons TemplateIcon
	ON ProcessTemplates.IconID = TemplateIcon.IconId
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateLanguage
	ON DefaultProcessTemplateLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateID

WHERE 
	ProjectField.IntValue = @ProjectId
	AND SecurityField.IntValue <= @SecurityLevelId
	AND ProjectTemplateField.ProcessTemplateFieldTypeID = 16
	AND SubjectTemplateField.ProcessTemplateFieldTypeID = 1
	AND SecurityTemplateField.ProcessTemplateFieldTypeID = 28
	END