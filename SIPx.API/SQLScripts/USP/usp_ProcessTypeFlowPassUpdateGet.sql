CREATE PROCEDURE usp_ProcessTypeFlowPassUpdateGet (@UserId nvarchar(450), @ProcessTypeFlowPassId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowPasses.ProcessTypeFlowPassID
	, ProcessTypeFlowPasses.ProcessTypeID
	, ProcessTypeFlowPasses.ProcessTypeFlowID
	, ProcessTypeFlowPasses.Sequence
	, ProcessTypeFlowPasses.ProcessTypeFlowPassTypeID
	, ProcessTypeFlowPasses.ProcessTypeFieldID
	, ProcessTypeFlowPasses.ProcessTypeFieldIDRole
	, ProcessTypeFlowPasses.ComparisonOperatorID
	, ProcessTypeFlowPasses.ProcessTypeFlowPassstring
	, ProcessTypeFlowPasses.ProcessTypeFlowPassInt
	, ProcessTypeFlowPasses.ProcessTypeFlowPassDate
	, ISNULL(UserProcessTypeFlowPassLanguage.Name,ISNULL(DefaultProcessTypeFlowPassLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeFlowPassLanguage.Description,ISNULL(DefaultProcessTypeFlowPassLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeFlowPassLanguage.MenuName,ISNULL(DefaultProcessTypeFlowPassLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeFlowPassLanguage.MouseOver,ISNULL(DefaultProcessTypeFlowPassLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeFlowPasses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeFlowPasses.ModifiedDate
FROM ProcessTypeFlowPasses 
LEFT JOIN (SELECT ProcessTypeFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowPassLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFlowPassLanguage
	ON UserProcessTypeFlowPassLanguage.ProcessTypeFlowPassId = ProcessTypeFlowPasses.ProcessTypeFlowPassID
LEFT JOIN (SELECT ProcessTypeFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowPassLanguages JOIN Settings ON ProcessTypeFlowPassLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFlowPassLanguage
	ON DefaultProcessTypeFlowPassLanguage.ProcessTypeFlowPassId = ProcessTypeFlowPasses.ProcessTypeFlowPassID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlowPasses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlowPasses.ModifierID
WHERE ProcessTypeFlowPasses.ProcessTypeFlowPassId = @ProcessTypeFlowPassID


