CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionUpdateGet] (@UserId nvarchar(450), @ProcessTemplateFlowConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
	, ProcessTemplateFlowConditions.ProcessTemplateID
	, ProcessTemplateFlowConditions.ProcessTemplateFlowID
	, ProcessTemplateFlowConditions.Sequence
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionTypeID
	, ProcessTemplateFlowConditions.ProcessTemplateFieldID
	, ProcessTemplateFlowConditions.ProcessTemplateFieldIDRole
	, ProcessTemplateFlowConditions.ComparisonOperatorID
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionString
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionInt
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionDate
	, ISNULL(UserProcessTemplateFlowConditionLanguage.Name,ISNULL(DefaultProcessTemplateFlowConditionLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFlowConditionLanguage.Description,ISNULL(DefaultProcessTemplateFlowConditionLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFlowConditionLanguage.MenuName,ISNULL(DefaultProcessTemplateFlowConditionLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFlowConditionLanguage.MouseOver,ISNULL(DefaultProcessTemplateFlowConditionLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ProcessTemplateFlowConditions.CreatorID
	, ProcessTemplateFlowConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ProcessTemplateFlowConditions.ModifierID
	, ProcessTemplateFlowConditions.ModifiedDate
FROM ProcessTemplateFlowConditions 
LEFT JOIN (SELECT ProcessTemplateFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFlowConditionLanguage
	ON UserProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionId = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
LEFT JOIN (SELECT ProcessTemplateFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages JOIN Settings ON ProcessTemplateFlowConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFlowConditionLanguage
	ON DefaultProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionId = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFlowConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFlowConditions.ModifierID
WHERE ProcessTemplateFlowConditions.ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionID


