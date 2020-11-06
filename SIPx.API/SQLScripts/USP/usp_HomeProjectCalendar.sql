CREATE PROCEDURE usp_HomeProjectCalendar (@ProjectId int)
AS
SELECT Processes.ProcessID Id
	, FromField.DateTimeValue StartTime
	, ToField.DateTimeValue EndTime
	, SubjectField.StringValue Subject
	, ProcessTemplates.Color
FROM processTemplates 
JOIN Processes 
	ON ProcessTemplates.ProcessTemplateID = Processes.ProcessTemplateID
JOIN ProcessTemplateFields ProjectTemplateField
	ON ProcessTemplates.ProcessTemplateID = ProjectTemplateField.ProcessTemplateID
JOIN ProcessFields ProjectField
	ON ProjectTemplateField.ProcessTemplateFieldID = ProjectField.ProcessTemplateFieldID
		AND Processes.ProcessID = ProjectField.ProcessID
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
WHERE processtemplates.ShowInProjectCalendar = 1
AND ProjectTemplateField.ProcessTemplateFieldTypeId = 14
AND ProjectField.IntValue = @ProjectId
AND FromTemplateField.ProcessTemplateFieldTypeID =8
AND ToTemplateField.ProcessTemplateFieldTypeID =9
AND SubjectTemplateField.ProcessTemplateFieldTypeID =1
AND SecurityTemplateField.ProcessTemplateFieldTypeID = 28
AND SecurityField.IntValue = 1
ORDER BY FromField.DateTimeValue 
