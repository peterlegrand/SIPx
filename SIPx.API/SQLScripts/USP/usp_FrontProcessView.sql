CREATE PROCEDURE usp_FrontProcessView (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


SELECT Processes.ProcessID
	, Processes.ProcessTypeID
	, Processes.ProcessTypeStageID
	, ProcessTypeStages.ProcessTypeStageTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this template')) ProcessTypeName
	, ISNULL(StageUserLanguage.Name,ISNULL(StageDefaultLanguage.Name,'No name for this stage')) ProcessTypeStageName
	, ISNULL(StageTypeUserLanguage.Name,ISNULL(StageTypeDefaultLanguage.Name,'No name for this stage type')) ProcessTypeStageTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorId
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Processes.ModifiedDate
	, Modifier.PersonID ModifierId

FROM processes 
JOIN ProcessTypes
	ON Processes.ProcessTypeID = ProcessTypes.ProcessTypeID
JOIN ProcessTypeStages
	ON Processes.ProcessTypeStageID = ProcessTypeStages.ProcessTypeStageID

LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver, ProcessTypeLanguageID FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTypeID= ProcessTypes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver, ProcessTypeLanguageID FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID


LEFT JOIN (SELECT ProcessTypeStageId, Name, Description, MenuName, MouseOver, ProcessTypeStageLanguageID FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) StageUserLanguage
	ON StageUserLanguage.ProcessTypeStageID= ProcessTypeStages.ProcessTypeStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name, Description, MenuName, MouseOver, ProcessTypeStageLanguageID FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageDefaultLanguage
	ON StageDefaultLanguage.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageID

LEFT JOIN (SELECT ProcessTypeStageTypeId, Name, Description, MenuName, MouseOver, ProcessTypeStageTypeLanguageID FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageID) StageTypeUserLanguage
	ON StageTypeUserLanguage.ProcessTypeStageTypeID= ProcessTypeStages.ProcessTypeStageTypeID
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name, Description, MenuName, MouseOver, ProcessTypeStageTypeLanguageID FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageTypeDefaultLanguage
	ON StageTypeDefaultLanguage.ProcessTypeStageTypeId = ProcessTypeStages.ProcessTypeStageTypeID


JOIN ProcessTypeStageLanguages
	ON ProcessTypeStageLanguages.ProcessTypeStageID = ProcessTypeStages.ProcessTypeStageID
JOIN ProcessTypeStageTypeLanguages
	ON ProcessTypeStages.ProcessTypeStageTypeID =  ProcessTypeStageTypeLanguages.ProcessTypeStageTypeID
JOIN Persons Creator
	ON Creator.UserId = processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = processes.ModifierID

WHERE Processes.ProcessID = @ProcessId
