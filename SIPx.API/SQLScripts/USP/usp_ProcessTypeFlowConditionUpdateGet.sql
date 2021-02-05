CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionUpdateGet] (@UserId nvarchar(450), @ProcessTypeFlowConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowConditions.ProcessTypeFlowConditionID
	, ProcessTypeFlowConditions.ProcessTypeID
	, ProcessTypeFlowConditions.ProcessTypeFlowID
	, ProcessTypeFlowConditions.Sequence
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionTypeID
	, ProcessTypeFlowConditions.ProcessTypeFieldID
	, ProcessTypeFlowConditions.ProcessTypeFieldIDRole
	, ProcessTypeFlowConditions.ComparisonOperatorID
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionString
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionInt
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionDate
	, ISNULL(UserProcessTypeFlowConditionLanguage.Name,ISNULL(DefaultProcessTypeFlowConditionLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeFlowConditionLanguage.Description,ISNULL(DefaultProcessTypeFlowConditionLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeFlowConditionLanguage.MenuName,ISNULL(DefaultProcessTypeFlowConditionLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeFlowConditionLanguage.MouseOver,ISNULL(DefaultProcessTypeFlowConditionLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeFlowConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeFlowConditions.ModifiedDate
FROM ProcessTypeFlowConditions 
LEFT JOIN (SELECT ProcessTypeFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowConditionLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFlowConditionLanguage
	ON UserProcessTypeFlowConditionLanguage.ProcessTypeFlowConditionId = ProcessTypeFlowConditions.ProcessTypeFlowConditionID
LEFT JOIN (SELECT ProcessTypeFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowConditionLanguages JOIN Settings ON ProcessTypeFlowConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFlowConditionLanguage
	ON DefaultProcessTypeFlowConditionLanguage.ProcessTypeFlowConditionId = ProcessTypeFlowConditions.ProcessTypeFlowConditionID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlowConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlowConditions.ModifierID
WHERE ProcessTypeFlowConditions.ProcessTypeFlowConditionId = @ProcessTypeFlowConditionID


