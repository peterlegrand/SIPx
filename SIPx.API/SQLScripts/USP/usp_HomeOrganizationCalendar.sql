CREATE PROCEDURE usp_HomeOrganizationCalendar (@OrganizationId int)
AS
SELECT Processes.ProcessID Id
	, FromField.DateTimeValue StartTime
	, ToField.DateTimeValue EndTime
	, SubjectField.StringValue Subject
	, ProcessTypes.Color
FROM processTypes 
JOIN Processes 
	ON ProcessTypes.ProcessTypeID = Processes.ProcessTypeID
JOIN ProcessTypeFields OrganizationTemplateField
	ON ProcessTypes.ProcessTypeID = OrganizationTemplateField.ProcessTypeID
JOIN ProcessFields OrganizationField
	ON OrganizationTemplateField.ProcessTypeFieldID = OrganizationField.ProcessTypeFieldID
		AND Processes.ProcessID = OrganizationField.ProcessID
JOIN ProcessTypeFields FromTemplateField
	ON Processes.ProcessTypeID = FromTemplateField.ProcessTypeID
JOIN ProcessFields FromField
	ON Processes.ProcessID = FromField.ProcessID
		AND FromField.ProcessTypeFieldID = FromTemplateField.ProcessTypeFieldID
JOIN ProcessTypeFields ToTemplateField
	ON Processes.ProcessTypeID = ToTemplateField.ProcessTypeID
JOIN ProcessFields ToField
	ON Processes.ProcessID = ToField.ProcessID
		AND ToField.ProcessTypeFieldID = ToTemplateField.ProcessTypeFieldID
JOIN ProcessTypeFields SubjectTemplateField
	ON Processes.ProcessTypeID = SubjectTemplateField.ProcessTypeID
JOIN ProcessFields SubjectField
	ON Processes.ProcessID = SubJectField.ProcessID
		AND SubjectField.ProcessTypeFieldID = SubjectTemplateField.ProcessTypeFieldID
JOIN ProcessTypeFields SecurityTemplateField
	ON Processes.ProcessTypeID = SecurityTemplateField.ProcessTypeID
JOIN ProcessFields SecurityField
	ON Processes.ProcessID = SecurityField.ProcessID
		AND SecurityField.ProcessTypeFieldID = SecurityTemplateField.ProcessTypeFieldID
WHERE processtypes.ShowInOrganizationCalendar = 1
AND SecurityTemplateField.ProcessTypeFieldTypeID = 28
AND SecurityField.IntValue = 1
AND OrganizationTemplateField.ProcessTypeFieldTypeId = 14
AND OrganizationField.IntValue = @OrganizationId
AND FromTemplateField.ProcessTypeFieldTypeID =8
AND ToTemplateField.ProcessTypeFieldTypeID =9
AND SubjectTemplateField.ProcessTypeFieldTypeID =1
ORDER BY FromField.DateTimeValue 
