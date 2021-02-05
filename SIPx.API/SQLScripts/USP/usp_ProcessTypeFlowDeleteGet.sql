CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowDeleteGet] (@UserId nvarchar(450), @ProcessTypeFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlows.ProcessTypeFlowID
	, ProcessTypeFlows.ProcessTypeID
	, ISNULL(UserProcessTypeFlowLanguage.Name,ISNULL(DefaultProcessTypeFlowLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeFlowLanguage.Description,ISNULL(DefaultProcessTypeFlowLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeFlowLanguage.MenuName,ISNULL(DefaultProcessTypeFlowLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeFlowLanguage.MouseOver,ISNULL(DefaultProcessTypeFlowLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserFromStageLanguage.Name,ISNULL(DefaultFromStageLanguage.Name,'No name for from stage')) ProcessTypeFromStageName
	, ISNULL(UserToStageLanguage.Name,ISNULL(DefaultToStageLanguage.Name,'No name for to stage')) ProcessTypeToStageName
	, ProcessTypeFlows.ProcessTypeFromStageID
	, ProcessTypeFlows.ProcessTypeToStageID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeFlows.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeFlows.ModifiedDate
FROM ProcessTypeFlows 
LEFT JOIN (SELECT ProcessTypeFlowId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFlowLanguage
	ON UserProcessTypeFlowLanguage.ProcessTypeFlowId = ProcessTypeFlows.ProcessTypeFlowID
LEFT JOIN (SELECT ProcessTypeFlowId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowLanguages JOIN Settings ON ProcessTypeFlowLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFlowLanguage
	ON DefaultProcessTypeFlowLanguage.ProcessTypeFlowId = ProcessTypeFlows.ProcessTypeFlowID
LEFT JOIN (SELECT ProcessTypeStageId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) UserFromStageLanguage
	ON UserFromStageLanguage.ProcessTypeStageId = ProcessTypeFlows.ProcessTypeFromStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultFromStageLanguage
	ON DefaultFromStageLanguage.ProcessTypeStageId = ProcessTypeFlows.ProcessTypeFromStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) UserToStageLanguage
	ON UserToStageLanguage.ProcessTypeStageId = ProcessTypeFlows.ProcessTypeToStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultToStageLanguage
	ON DefaultToStageLanguage.ProcessTypeStageId = ProcessTypeFlows.ProcessTypeToStageID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlows.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlows.ModifierID
WHERE ProcessTypeFlows.ProcessTypeFlowId = @ProcessTypeFlowID
ORDER BY ISNULL(UserProcessTypeFlowLanguage.Name,ISNULL(DefaultProcessTypeFlowLanguage.Name,'No name for this role'))