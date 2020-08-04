ALTER PROCEDURE usp_personalOrganizationCalendar (@UserId nvarchar(450))
AS
SELECT Processes.ProcessID Id
	, FromField.DateTimeValue StartTime
	, ToField.DateTimeValue EndTime
	, SubjectField.StringValue Subject
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
JOIN persons
	ON persons.DefaultOrganizationID = ProcessFields.IntValue
WHERE processtemplates.ShowInOrganizationCalendar = 1
AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 14
AND persons.UserID = @UserId
AND FromTemplateField.ProcessTemplateFieldTypeID =8
AND ToTemplateField.ProcessTemplateFieldTypeID =9
AND SubjectTemplateField.ProcessTemplateFieldTypeID =1
ORDER BY FromField.DateTimeValue 
