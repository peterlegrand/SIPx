ALTER PROCEDURE usp_FrontProcessEditGetFields (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @StageId int
SELECT @StageId = Processes.ProcessTemplateStageID FROM Processes WHERE Processes.ProcessID = @ProcessId;

SELECT ProcessFields.ProcessID
	, ProcessFields.ProcessFieldID
	, ISNULL(ProcessFields.IntValue,0) IntValue
	, ISNULL(ProcessFields.StringValue,'') StringValue
	, ISNULL(ProcessFields.DateTimeValue,'1-1-1') DateTimeValue 
	, ProcessTemplateFieldLanguages.Name FieldName
	, ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID 
	, ProcessTemplateStageFields.Sequence
	, 'ProcessField' + cast(ProcessFieldID as varchar(10)) ControlProcessFieldId
	, 'ProcessId' + cast(ProcessFieldID as varchar(10)) ControlProcessId
	, 'Control' + cast(ProcessFieldID as varchar(10)) ControlId
	, 'Controla' + cast(ProcessFieldID as varchar(10)) ControlId1
	, 'Controlb' + cast(ProcessFieldID as varchar(10)) ControlId2
	, 'Controlc' + cast(ProcessFieldID as varchar(10)) ControlId3
	, 'Controld' + cast(ProcessFieldID as varchar(10)) ControlId4
	, 'Controle' + cast(ProcessFieldID as varchar(10)) ControlId5
	, 'Controlf' + cast(ProcessFieldID as varchar(10)) ControlId6
	, 'Controlg' + cast(ProcessFieldID as varchar(10)) ControlId7
	, 'Controlh' + cast(ProcessFieldID as varchar(10)) ControlId8
	, 'Controli' + cast(ProcessFieldID as varchar(10)) ControlId9
	, ProcessTemplateFields.ProcessTemplateFieldTypeID
FROM ProcessFields
JOIN ProcessTemplateFields
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
JOIN ProcessTemplateFieldLanguages
	ON ProcessTemplateFieldLanguages.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID  
JOIN ProcessTemplateStageFields
	ON ProcessTemplateStageFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
WHERE ProcessTemplateStageFields.ProcessTemplateStageID = @StageId
	AND ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID <> 1
	AND ProcessTemplateFieldLanguages.LanguageID = @LanguageId
	AND ProcessFields.ProcessID = @ProcessId
ORDER BY ProcessTemplateStageFields.Sequence

