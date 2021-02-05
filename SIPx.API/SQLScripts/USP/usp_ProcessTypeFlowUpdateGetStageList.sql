CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowUpdateGetStageList] (@UserId nvarchar(450), @ProcessTypeFlowID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTypeId int;
SELECT @ProcessTypeId = ProcessTypeId
FROM ProcessTypeFlows
WHERE ProcessTypeFlows.ProcessTypeFlowID = @ProcessTypeFlowID;

SELECT ProcessTypeStages.ProcessTypeStageID
	, ISNULL(UserProcessTypeStageLanguage.Name,ISNULL(DefaultProcessTypeStageLanguage.Name,'No name for this stage')) Name
FROM ProcessTypeStages 
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageLanguage
	ON UserProcessTypeStageLanguage.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageLanguage
	ON DefaultProcessTypeStageLanguage.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageID
WHERE ProcessTypeStages.ProcessTypeID = @ProcessTypeId
ORDER BY ISNULL(UserProcessTypeStageLanguage.Name,ISNULL(DefaultProcessTypeStageLanguage.Name,'No name for this stage'))