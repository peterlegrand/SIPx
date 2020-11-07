CREATE PROCEDURE usp_HomePersonalCalendar (@UserId nvarchar(450))
AS
SELECT Processes.ProcessID Id
	, FromField.DateTimeValue StartTime
	, ToField.DateTimeValue EndTime
	, SubjectField.StringValue Subject
	, ProcessTemplates.Color
FROM processTemplates 
JOIN Processes 
	ON ProcessTemplates.ProcessTemplateID = Processes.ProcessTemplateID
JOIN ProcessTemplateFields
	ON ProcessTemplates.ProcessTemplateID = ProcessTemplatefields.ProcessTemplateID
JOIN ProcessFields
	ON ProcessTemplateFields.ProcessTemplateFieldID = ProcessFields.ProcessTemplateFieldID
		AND Processes.ProcessID = ProcessFields.ProcessID
JOIN ProcessTemplateFields FromTemplateField
	ON Processes.ProcessTemplateID = FromTemplateField.ProcessTemplateID
JOIN ProcessFields FromField
	ON Processes.ProcessID = FromField.ProcessID
		AND FromField.ProcessTemplateFieldID = FromTemplateField.ProcessTemplateFieldID
JOIN ProcessTemplateFields ToTemplateField
	ON Processes.ProcessTemplateID = ToTemplateField.ProcessTemplateID
JOIN ProcessFields ToField
	ON Processes.ProcessID = ToField.ProcessID
		AND ToField.ProcessTemplateFieldID = ToTemplateField.ProcessTemplateFieldID
JOIN ProcessTemplateFields SubjectTemplateField
	ON Processes.ProcessTemplateID = SubjectTemplateField.ProcessTemplateID
JOIN ProcessFields SubjectField
	ON Processes.ProcessID = SubJectField.ProcessID
		AND SubjectField.ProcessTemplateFieldID = SubjectTemplateField.ProcessTemplateFieldID
JOIN ProcessTemplateFields SecurityTemplateField
	ON Processes.ProcessTemplateID = SecurityTemplateField.ProcessTemplateID
JOIN ProcessFields SecurityField
	ON Processes.ProcessID = SecurityField.ProcessID
		AND SecurityField.ProcessTemplateFieldID = SecurityTemplateField.ProcessTemplateFieldID
WHERE processtemplates.ShowInPersonalCalendar = 1
AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 12
AND ProcessFields.StringValue = @UserId
AND FromTemplateField.ProcessTemplateFieldTypeID =8
AND ToTemplateField.ProcessTemplateFieldTypeID =9
AND SubjectTemplateField.ProcessTemplateFieldTypeID =1
AND SecurityTemplateField.ProcessTemplateFieldTypeID = 28
AND SecurityField.IntValue = 1
ORDER BY FromField.DateTimeValue 