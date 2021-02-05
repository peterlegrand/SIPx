CREATE PROCEDURE usp_ProcessTypeFlowPassUpdateGetFieldRoleList (@UserId nvarchar(450), @ProcessTypeFlowPassId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTypeId int;

SELECT @ProcessTypeId = ProcessTypeId FROM ProcessTypeFlowPasses WHERE ProcessTypeFlowPassId = @ProcessTypeFlowPassId;
SELECT ProcessTypeFields.ProcessTypeFieldID
	, ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this field')) Name
FROM ProcessTypeFields 
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
WHERE ProcessTypeFields.ProcessTypeId = @ProcessTypeID 
	AND ProcessTypeFields.ProcessTypeFieldTypeID IN (30,31, 34,35)
ORDER BY ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this field'))