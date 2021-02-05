CREATE PROCEDURE usp_FrontProcessEditGet (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


SELECT Processes.ProcessID
	, Processes.ProcessTypeID
	, Processes.ProcessTypeStageID
	, ProcessTypeStageTypeLanguages.ProcessTypeStageTypeID
	, ProcessTypeStageTypeLanguages.Name StageTypeName
	, ProcessTypeLanguages.Name  TemplateName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Processes.ModifiedDate

FROM processes 
JOIN ProcessTypes
	ON Processes.ProcessTypeID = ProcessTypes.ProcessTypeID
JOIN ProcessTypeStages
	ON Processes.ProcessTypeStageID = ProcessTypeStages.ProcessTypeStageID
JOIN ProcessTypeLanguages
	ON ProcessTypeLanguages.ProcessTypeID = ProcessTypes.ProcessTypeID
JOIN ProcessTypeStageLanguages
	ON ProcessTypeStageLanguages.ProcessTypeStageID = ProcessTypeStages.ProcessTypeStageID
JOIN ProcessTypeStageTypeLanguages
	ON ProcessTypeStages.ProcessTypeStageTypeID =  ProcessTypeStageTypeLanguages.ProcessTypeStageTypeID
JOIN Persons Creator
	ON Creator.UserId = processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = processes.ModifierID

WHERE ProcessTypeStageLanguages.LanguageID = @LanguageId
	AND ProcessTypeLanguages.LanguageID =@LanguageId
	AND ProcessTypeStageTypeLanguages.LanguageID = @LanguageId
	AND Processes.ProcessID = @ProcessId
