CREATE PROCEDURE usp_ProcessTemplateFlowPassUpdateGet (@UserId nvarchar(450), @ProcessTemplateFlowPassId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
	, ProcessTemplateFlowPasses.ProcessTemplateID
	, ProcessTemplateFlowPasses.ProcessTemplateFlowID
	, ProcessTemplateFlowPasses.Sequence
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassTypeID
	, ProcessTemplateFlowPasses.ProcessTemplateFieldID
	, ProcessTemplateFlowPasses.ProcessTemplateFieldIDRole
	, ProcessTemplateFlowPasses.ComparisonOperatorID
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassstring
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassInt
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassDate
	, ISNULL(UserProcessTemplateFlowPassLanguage.Name,ISNULL(DefaultProcessTemplateFlowPassLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFlowPassLanguage.Description,ISNULL(DefaultProcessTemplateFlowPassLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFlowPassLanguage.MenuName,ISNULL(DefaultProcessTemplateFlowPassLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFlowPassLanguage.MouseOver,ISNULL(DefaultProcessTemplateFlowPassLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateFlowPasses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTemplateFlowPasses.ModifiedDate
FROM ProcessTemplateFlowPasses 
LEFT JOIN (SELECT ProcessTemplateFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowPassLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFlowPassLanguage
	ON UserProcessTemplateFlowPassLanguage.ProcessTemplateFlowPassId = ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
LEFT JOIN (SELECT ProcessTemplateFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowPassLanguages JOIN Settings ON ProcessTemplateFlowPassLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFlowPassLanguage
	ON DefaultProcessTemplateFlowPassLanguage.ProcessTemplateFlowPassId = ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFlowPasses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFlowPasses.ModifierID
WHERE ProcessTemplateFlowPasses.ProcessTemplateFlowPassId = @ProcessTemplateFlowPassID


