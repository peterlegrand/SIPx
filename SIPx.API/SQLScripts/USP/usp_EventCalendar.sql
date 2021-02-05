CREATE PROCEDURE usp_EventCalendar 
AS
SELECT Processes.ProcessID Id
	, FromField.DateTimeValue StartTime
	, ToField.DateTimeValue EndTime
	, SubjectField.StringValue Subject
	, ProcessTypes.Color
FROM processTypes 
JOIN Processes 
	ON ProcessTypes.ProcessTypeID = Processes.ProcessTypeID
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

WHERE processtypes.ShowInEventCalendar = 1
AND FromTemplateField.ProcessTypeFieldTypeID =8
AND ToTemplateField.ProcessTypeFieldTypeID =9
AND SubjectTemplateField.ProcessTypeFieldTypeID =1
ORDER BY FromField.DateTimeValue 
