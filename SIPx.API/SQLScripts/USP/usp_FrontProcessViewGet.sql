CREATE PROCEDURE usp_FrontProcessViewGet (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


SELECT Processes.ProcessID
	, Processes.ProcessTemplateID
	, Processes.ProcessTemplateStageID
	, ProcessTemplateStages.ProcessTemplateStageTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this template')) ProcessTemplateName
	, ISNULL(StageUserLanguage.Name,ISNULL(StageDefaultLanguage.Name,'No name for this stage')) ProcessTemplateStageName
	, ISNULL(StageTypeUserLanguage.Name,ISNULL(StageTypeDefaultLanguage.Name,'No name for this stage type')) ProcessTemplateStageTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorId
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Processes.ModifiedDate
	, Modifier.PersonID ModifierId

FROM processes 
JOIN ProcessTemplates
	ON Processes.ProcessTemplateID = ProcessTemplates.ProcessTemplateID
JOIN ProcessTemplateStages
	ON Processes.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID

LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver, ProcessTemplateLanguageID FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver, ProcessTemplateLanguageID FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateID


LEFT JOIN (SELECT ProcessTemplateStageId, Name, Description, MenuName, MouseOver, ProcessTemplateStageLanguageID FROM ProcessTemplateStageLanguages WHERE LanguageId = @LanguageID) StageUserLanguage
	ON StageUserLanguage.ProcessTemplateStageID= ProcessTemplateStages.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageId, Name, Description, MenuName, MouseOver, ProcessTemplateStageLanguageID FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageDefaultLanguage
	ON StageDefaultLanguage.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageID

LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name, Description, MenuName, MouseOver, ProcessTemplateStageTypeLanguageID FROM ProcessTemplateStageTypeLanguages WHERE LanguageId = @LanguageID) StageTypeUserLanguage
	ON StageTypeUserLanguage.ProcessTemplateStageTypeID= ProcessTemplateStages.ProcessTemplateStageTypeID
LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name, Description, MenuName, MouseOver, ProcessTemplateStageTypeLanguageID FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageTypeDefaultLanguage
	ON StageTypeDefaultLanguage.ProcessTemplateStageTypeId = ProcessTemplateStages.ProcessTemplateStageTypeID


JOIN ProcessTemplateStageLanguages
	ON ProcessTemplateStageLanguages.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID
JOIN ProcessTemplateStageTypeLanguages
	ON ProcessTemplateStages.ProcessTemplateStageTypeID =  ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeID
JOIN Persons Creator
	ON Creator.UserId = processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = processes.ModifierID

WHERE Processes.ProcessID = @ProcessId
