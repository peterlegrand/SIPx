CREATE PROCEDURE usp_ProcessTypeFlowPassUpdateGetSequence (@UserId nvarchar(450), @ProcessTypeFlowPassId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTypeFlowId int;
SELECT @ProcessTypeFlowId = ProcessTypeFlowId FROM ProcessTypeFlowPasses WHERE ProcessTypeFlowPassId= @ProcessTypeFlowPassId
SELECT ProcessTypeFlowPasses.Sequence
	, ISNULL(UserProcessTypeFlowPassLanguage.Name,ISNULL(DefaultProcessTypeFlowPassLanguage.Name,'No name for this level')) Name
FROM ProcessTypeFlowPasses 
LEFT JOIN (SELECT ProcessTypeFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowPassLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFlowPassLanguage
	ON UserProcessTypeFlowPassLanguage.ProcessTypeFlowPassId = ProcessTypeFlowPasses.ProcessTypeFlowPassID
LEFT JOIN (SELECT ProcessTypeFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowPassLanguages JOIN Settings ON ProcessTypeFlowPassLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFlowPassLanguage
	ON DefaultProcessTypeFlowPassLanguage.ProcessTypeFlowPassId = ProcessTypeFlowPasses.ProcessTypeFlowPassID
WHERE ProcessTypeFlowPasses.ProcessTypeFlowID = @ProcessTypeFlowId
ORDER BY  ISNULL(UserProcessTypeFlowPassLanguage.Name,ISNULL(DefaultProcessTypeFlowPassLanguage.Name,'No name for this level'))

