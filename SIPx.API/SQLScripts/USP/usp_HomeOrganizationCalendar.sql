CREATE PROCEDURE usp_HomeOrganizationCalendar (@OrganizationId int)
AS
SELECT Processes.ProcessID Id
	, FromField.DateTimeValue StartTime
	, ToField.DateTimeValue EndTime
	, SubjectField.StringValue Subject
	, ProcessTemplates.Color
FROM processTemplates 
JOIN Processes 
	ON ProcessTemplates.ProcessTemplateID = Processes.ProcessTemplateID
JOIN ProcessTemplateFields OrganizationTemplateField
	ON ProcessTemplates.ProcessTemplateID = OrganizationTemplateField.ProcessTemplateID
JOIN ProcessFields OrganizationField
	ON OrganizationTemplateField.ProcessTemplateFieldID = OrganizationField.ProcessTemplateFieldID
		AND Processes.ProcessID = OrganizationField.ProcessID
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
WHERE processtemplates.ShowInOrganizationCalendar = 1
AND SecurityTemplateField.ProcessTemplateFieldTypeID = 28
AND SecurityField.IntValue = 1
AND OrganizationTemplateField.ProcessTemplateFieldTypeId = 14
AND OrganizationField.IntValue = @OrganizationId
AND FromTemplateField.ProcessTemplateFieldTypeID =8
AND ToTemplateField.ProcessTemplateFieldTypeID =9
AND SubjectTemplateField.ProcessTemplateFieldTypeID =1
ORDER BY FromField.DateTimeValue 
