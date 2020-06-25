CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlow] (@UserID nvarchar(450), @ProcessTemplateFlowID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ProcessTemplateFlows.ProcessTemplateFlowID
	, ISNULL(UserProcessTemplateFlowLanguage.Name,ISNULL(DefaultProcessTemplateFlowLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFlowLanguage.Description,ISNULL(DefaultProcessTemplateFlowLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFlowLanguage.MenuName,ISNULL(DefaultProcessTemplateFlowLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFlowLanguage.MouseOver,ISNULL(DefaultProcessTemplateFlowLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ProcessTemplateFlows.ProcessTemplateFromStageID
	, ProcessTemplateFlows.ProcessTemplateToStageID
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFlows.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFlows.ModifiedDate
FROM ProcessTemplateFlows 
LEFT JOIN (SELECT ProcessTemplateFlowID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateFlowLanguage
	ON UserProcessTemplateFlowLanguage.ProcessTemplateFlowID = ProcessTemplateFlows.ProcessTemplateFlowID
LEFT JOIN (SELECT ProcessTemplateFlowID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowLanguages JOIN Settings ON ProcessTemplateFlowLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateFlowLanguage
	ON DefaultProcessTemplateFlowLanguage.ProcessTemplateFlowID = ProcessTemplateFlows.ProcessTemplateFlowID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFlows.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFlows.ModifierID
WHERE ProcessTemplateFlows.ProcessTemplateFlowID = @ProcessTemplateFlowID
