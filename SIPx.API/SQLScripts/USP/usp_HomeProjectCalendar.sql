CREATE PROCEDURE usp_HomeProjectCalendar (@ProjectId int)
AS
SELECT Processes.ProcessID Id
	, FromField.DateTimeValue StartTime
	, ToField.DateTimeValue EndTime
	, SubjectField.StringValue Subject
	, ProcessTypes.Color
FROM processTypes 
JOIN Processes 
	ON ProcessTypes.ProcessTypeID = Processes.ProcessTypeID
JOIN ProcessTypeFields ProjectTemplateField
	ON ProcessTypes.ProcessTypeID = ProjectTemplateField.ProcessTypeID
JOIN ProcessFields ProjectField
	ON ProjectTemplateField.ProcessTypeFieldID = ProjectField.ProcessTypeFieldID
		AND Processes.ProcessID = ProjectField.ProcessID
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
WHERE processtypes.ShowInProjectCalendar = 1
AND ProjectTemplateField.ProcessTypeFieldTypeId = 14
AND ProjectField.IntValue = @ProjectId
AND FromTemplateField.ProcessTypeFieldTypeID =8
AND ToTemplateField.ProcessTypeFieldTypeID =9
AND SubjectTemplateField.ProcessTypeFieldTypeID =1
AND SecurityTemplateField.ProcessTypeFieldTypeID = 28
AND SecurityField.IntValue = 1
ORDER BY FromField.DateTimeValue 
