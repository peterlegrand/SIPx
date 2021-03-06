CREATE PROCEDURE usp_ProcessTypeFlowConditionUpdateGetSequence (@UserId nvarchar(450), @ProcessTypeFlowConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTypeFlowId int;
SELECT @ProcessTypeFlowId = ProcessTypeFlowId FROM ProcessTypeFlowConditions WHERE ProcessTypeFlowConditionId= @ProcessTypeFlowConditionId
SELECT ProcessTypeFlowConditions.Sequence
	, ISNULL(UserProcessTypeFlowConditionLanguage.Name,ISNULL(DefaultProcessTypeFlowConditionLanguage.Name,'No name for this level')) Name
FROM ProcessTypeFlowConditions 
LEFT JOIN (SELECT ProcessTypeFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowConditionLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFlowConditionLanguage
	ON UserProcessTypeFlowConditionLanguage.ProcessTypeFlowConditionId = ProcessTypeFlowConditions.ProcessTypeFlowConditionID
LEFT JOIN (SELECT ProcessTypeFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowConditionLanguages JOIN Settings ON ProcessTypeFlowConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFlowConditionLanguage
	ON DefaultProcessTypeFlowConditionLanguage.ProcessTypeFlowConditionId = ProcessTypeFlowConditions.ProcessTypeFlowConditionID
WHERE ProcessTypeFlowConditions.ProcessTypeFlowID = @ProcessTypeFlowId
ORDER BY  ISNULL(UserProcessTypeFlowConditionLanguage.Name,ISNULL(DefaultProcessTypeFlowConditionLanguage.Name,'No name for this level'))

