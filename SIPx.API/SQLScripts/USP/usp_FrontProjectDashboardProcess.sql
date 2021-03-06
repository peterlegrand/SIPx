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
	, ISNULL(UserProcessTypeStageTypeLanguage.Name
		,ISNULL(DefaultProcessTypeStageTypeLanguage.Name
			,'No name for this stage type')) ProcessTypeStageTypeName
	, ISNULL(UserProcessTypeLanguage.Name
		,ISNULL(DefaultProcessTypeLanguage.Name
			,'No name for this process type')) ProcessTypeName
	, ProcessTypes.Color TemplateColor
	, ProcessTypeStageTypes.Color StageTypeColor
	, StageTypeIcon.FileName StageTypeIconFileName
	, TemplateIcon.FileName TemplateIconFileName

FROM Processes
JOIN ProcessFields ProjectField
	ON Processes.ProcessID = ProjectField.ProcessID

JOIN ProcessTypeFields	ProjectTemplateField
	ON ProjectTemplateField.ProcessTypeFieldID = ProjectField.ProcessTypeFieldID

JOIN ProcessFields SubjectField
	ON Processes.ProcessID = SubjectField.ProcessID

JOIN ProcessTypeFields	SubjectTemplateField
	ON SubjectTemplateField.ProcessTypeFieldID = SubjectField.ProcessTypeFieldID

JOIN ProcessFields SecurityField
	ON Processes.ProcessID = SecurityField.ProcessID

JOIN ProcessTypeFields	SecurityTemplateField
	ON SecurityTemplateField.ProcessTypeFieldID = SecurityField.ProcessTypeFieldID

JOIN ProcessTypeStages
	ON Processes.ProcessTypeStageID = ProcessTypeStages.ProcessTypeStageID

JOIN ProcessTypeStageTypes
	ON ProcessTypeStageTypes.ProcessTypeStageTypeID = ProcessTypeStages.ProcessTypeStageTypeID
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageTypeLanguage
	ON UserProcessTypeStageTypeLanguage.ProcessTypeStageTypeID= ProcessTypeStageTypes.ProcessTypeStageTypeID
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageTypeLanguage
	ON DefaultProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStageTypes.ProcessTypeStageTypeID
JOIN Icons StageTypeIcon
	ON ProcessTypeStageTypes.IconID = StageTypeIcon.IconId
JOIN ProcessTypes 
	ON ProcessTypes.ProcessTypeID = Processes.ProcessTypeID
JOIN Icons TemplateIcon
	ON ProcessTypes.IconID = TemplateIcon.IconId
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeLanguage
	ON UserProcessTypeLanguage.ProcessTypeID= ProcessTypes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeLanguage
	ON DefaultProcessTypeLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID

WHERE 
	ProjectField.IntValue = @ProjectId
	AND SecurityField.IntValue <= @SecurityLevelId
	AND ProjectTemplateField.ProcessTypeFieldTypeID = 16
	AND SubjectTemplateField.ProcessTypeFieldTypeID = 1
	AND SecurityTemplateField.ProcessTypeFieldTypeID = 28
	END