CREATE PROCEDURE usp_FrontProcessEditGet (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


SELECT Processes.ProcessID
	, Processes.ProcessTemplateID
	, Processes.ProcessTemplateStageID
	, ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeID
	, ProcessTemplateStageTypeLanguages.Name StageTypeName
	, ProcessTemplateLanguages.Name  TemplateName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Processes.ModifiedDate

FROM processes 
JOIN ProcessTemplates
	ON Processes.ProcessTemplateID = ProcessTemplates.ProcessTemplateID
JOIN ProcessTemplateStages
	ON Processes.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID
JOIN ProcessTemplateLanguages
	ON ProcessTemplateLanguages.ProcessTemplateID = ProcessTemplates.ProcessTemplateID
JOIN ProcessTemplateStageLanguages
	ON ProcessTemplateStageLanguages.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID
JOIN ProcessTemplateStageTypeLanguages
	ON ProcessTemplateStages.ProcessTemplateStageTypeID =  ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeID
JOIN Persons Creator
	ON Creator.UserId = processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = processes.ModifierID

WHERE ProcessTemplateStageLanguages.LanguageID = @LanguageId
	AND ProcessTemplateLanguages.LanguageID =@LanguageId
	AND ProcessTemplateStageTypeLanguages.LanguageID = @LanguageId
	AND Processes.ProcessID = @ProcessId
