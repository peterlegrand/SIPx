CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowIndexGet] (@UserId nvarchar(450), @ProcessTemplateId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlows.ProcessTemplateFlowID
	, ISNULL(UserProcessTemplateFlowLanguage.Name,ISNULL(DefaultProcessTemplateFlowLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFlowLanguage.Description,ISNULL(DefaultProcessTemplateFlowLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFlowLanguage.MenuName,ISNULL(DefaultProcessTemplateFlowLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFlowLanguage.MouseOver,ISNULL(DefaultProcessTemplateFlowLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ProcessTemplateFlows.ProcessTemplateFromStageID
	, ProcessTemplateFlows.ProcessTemplateToStageID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateFlows.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTemplateFlows.ModifiedDate
FROM ProcessTemplateFlows 
LEFT JOIN (SELECT ProcessTemplateFlowId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFlowLanguage
	ON UserProcessTemplateFlowLanguage.ProcessTemplateFlowId = ProcessTemplateFlows.ProcessTemplateFlowID
LEFT JOIN (SELECT ProcessTemplateFlowId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowLanguages JOIN Settings ON ProcessTemplateFlowLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFlowLanguage
	ON DefaultProcessTemplateFlowLanguage.ProcessTemplateFlowId = ProcessTemplateFlows.ProcessTemplateFlowID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFlows.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFlows.ModifierID
WHERE ProcessTemplateFlows.ProcessTemplateId = @ProcessTemplateID
ORDER BY ISNULL(UserProcessTemplateFlowLanguage.Name,ISNULL(DefaultProcessTemplateFlowLanguage.Name,'No name for this role'))