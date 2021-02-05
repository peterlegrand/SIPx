CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldUpdateGetSequence] (@UserId nvarchar(450), @ProcessTypeFieldId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ProcessTypeID int;
SELECT @ProcessTypeID = ProcessTypeID FROM ProcessTypeFields WHERE ProcessTypeFields.ProcessTypeFieldID = @ProcessTypeFieldId
SELECT ProcessTypeFields.ProcessTypeFieldID
	, ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this role')) Name
FROM ProcessTypeFields 
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
WHERE ProcessTypeFields.ProcessTypeFieldID <> @ProcessTypeFieldId
	AND ProcessTypeFields.ProcessTypeID = @ProcessTypeID
ORDER BY  ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this role'))

