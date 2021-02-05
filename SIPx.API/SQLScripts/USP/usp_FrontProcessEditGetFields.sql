CREATE PROCEDURE usp_FrontProcessEditGetFields (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @StageId int
SELECT @StageId = Processes.ProcessTypeStageID FROM Processes WHERE Processes.ProcessID = @ProcessId;

SELECT ProcessFields.ProcessID
	, ProcessFields.ProcessFieldID
	, ISNULL(ProcessFields.IntValue,0) IntValue
	, ISNULL(ProcessFields.StringValue,'') StringValue
	, ISNULL(ProcessFields.DateTimeValue,'1-1-1') DateTimeValue 
	, ProcessTypeFieldLanguages.Name FieldName
	, ProcessTypeStageFields.ProcessTypeStageFieldStatusID 
	, ProcessTypeStageFields.Sequence
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
	, ProcessTypeFields.ProcessTypeFieldTypeID
FROM ProcessFields
JOIN ProcessTypeFields
	ON ProcessFields.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID
JOIN ProcessTypeFieldLanguages
	ON ProcessTypeFieldLanguages.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID  
JOIN ProcessTypeStageFields
	ON ProcessTypeStageFields.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID
WHERE ProcessTypeStageFields.ProcessTypeStageID = @StageId
	AND ProcessTypeStageFields.ProcessTypeStageFieldStatusID <> 1
	AND ProcessTypeFieldLanguages.LanguageID = @LanguageId
	AND ProcessFields.ProcessID = @ProcessId
ORDER BY ProcessTypeStageFields.Sequence

