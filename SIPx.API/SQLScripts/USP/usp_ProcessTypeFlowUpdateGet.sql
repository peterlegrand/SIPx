CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowUpdateGet] (@UserId nvarchar(450), @ProcessTypeFlowId int) 
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
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlows.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlows.ModifierID
WHERE ProcessTypeFlows.ProcessTypeFlowId = @ProcessTypeFlowID
