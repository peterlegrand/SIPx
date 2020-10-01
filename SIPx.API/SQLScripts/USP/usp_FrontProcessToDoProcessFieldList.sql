CREATE PROCEDURE usp_FrontProcessToDoProcessFieldList (@ProcessId int)
AS

SELECT ProcessFields.ProcessFieldID
	, ProcessFields.StringValue
	, ProcessFields.IntValue
	, ProcessFields.DateTimeValue
	, ProcessFields.ProcessTemplateFieldID
	, ProcessTemplateFields.ProcessTemplateFieldTypeID
FROM ProcessFields 
JOIN ProcessTemplateFields
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
WHERE ProcessId = @ProcessId
