CREATE PROCEDURE [dbo].[usp_ProcessTypeStageFieldUpdateGetSequence] (@UserId nvarchar(450), @ProcessTypeStageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTypeID int;
SELECT @ProcessTypeID = ProcessTypeID FROM ProcessTypeStages WHERE ProcessTypeStageId = @ProcessTypeStageId ; 
SELECT ProcessTypeStageFields.Sequence
	, ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this role')) Name
FROM ProcessTypeFields 
JOIN ProcessTypeStageFields
	ON ProcessTypeFields.ProcessTypeFieldID = ProcessTypeStageFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
WHERE ProcessTypeFields.ProcessTypeId = @ProcessTypeID
	AND ProcessTypeStageFields.ProcessTypeStageId = @ProcessTypeStageId
ORDER BY ProcessTypeStageFields.Sequence