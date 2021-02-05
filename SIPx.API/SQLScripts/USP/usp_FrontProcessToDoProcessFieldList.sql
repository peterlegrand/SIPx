CREATE PROCEDURE usp_FrontProcessToDoProcessFieldList (@ProcessId int)
AS

SELECT ProcessFields.ProcessFieldID
	, ProcessFields.StringValue
	, ProcessFields.IntValue
	, ProcessFields.DateTimeValue
	, ProcessFields.ProcessTypeFieldID
	, ProcessTypeFields.ProcessTypeFieldTypeID
FROM ProcessFields 
JOIN ProcessTypeFields
	ON ProcessFields.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID
WHERE ProcessId = @ProcessId
