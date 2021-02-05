CREATE PROCEDURE [dbo].[usp_NewProcessGet] ( @ProcessTypeId int, @UserID nvarchar(450))
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTypeStageFields.ProcessTypeStageFieldStatusID
	,  ProcessTypeStageFields.Sequence
	, CASE WHEN ProcessTypeStageFields.ValueUpdateTypeID = 1
	 THEN NULL ELSE ProcessTypeStageFields.IntValue END IntValue
	, CASE WHEN ProcessTypeStageFields.ValueUpdateTypeID = 1 
	 THEN '1900-01-01' ELSE ProcessTypeStageFields.DateTimeValue END DateTimeValue 
	, CASE WHEN ProcessTypeStageFields.ValueUpdateTypeID = 1
	 THEN '' ELSE ProcessTypeStageFields.StringValue END StringValue
--	, ProcessTypeStageFields.LocationValue
	, ProcessTypeStageFields.ValueUpdateTypeID
	, ProcessTypeFields.ProcessTypeFieldID
	, ProcessTypeFields.ProcessTypeFieldTypeID
	, ProcessTypeFields.ProcessTypeID
	, ProcessTypeStageFields.ProcessTypeStageID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this field')) Name
	, ISNULL(UserLanguage.MissingValueText,ISNULL(DefaultLanguage.MissingValueText,'No missing value text for this field')) MissingValueText
	, 'ControlId' + trim(cast(ProcessTypeFields.ProcessTypeFieldID as varchar(10)))  ControlId
	, 'ControlIdFieldId' + trim(cast(ProcessTypeFields.ProcessTypeFieldID as varchar(10)))  ControlIdProcessTypeFieldId
	, 'ControlIdFieldTypeId' + trim(cast(ProcessTypeFields.ProcessTypeFieldID as varchar(10)))  ControlIdProcessTypeFieldTypeId
	, 'ControlIdFunction' + trim(cast(ProcessTypeFields.ProcessTypeFieldID as varchar(10))) +'()' ControlIdOnFocusOutFunction
	, 'ControlIdWarningId' + trim(cast(ProcessTypeFields.ProcessTypeFieldID as varchar(10)))  ControlIdWarning
	--, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this field')) Description
	--, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this field')) MenuName
	--, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this field')) MouseOver
FROM ProcessTypeFlows 
JOIN ProcessTypeStageFields
	ON ProcessTypeFlows.ProcessTypeFromStageId = ProcessTypeStageFields.ProcessTypeStageID
		AND ProcessTypeFlows.ProcessTypeId = ProcessTypeStageFields.ProcessTypeID
JOIN ProcessTypeFields
	ON ProcessTypeStageFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver, MissingValueText FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTypeFieldID= ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver, MissingValueText FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
WHERE ProcessTypeFlows.ProcessTypeFromStageId NOT IN (SELECT ProcessTypeToStageId FROM ProcessTypeFlows WHERE ProcessTypeId = @ProcessTypeID)
	AND ProcessTypeFlows.ProcessTypeId = @ProcessTypeId 
ORDER BY ProcessTypeStageFields.Sequence

	


