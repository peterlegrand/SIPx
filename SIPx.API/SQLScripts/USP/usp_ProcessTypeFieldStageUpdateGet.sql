CREATE PROCEDURE usp_ProcessTypeFieldStageUpdateGet (@UserId nvarchar(450), @ProcessTypeStageFieldId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeStageFields.ProcessTypeStageFieldID
	, ProcessTypeStageFields.ProcessTypeStageID
	, ProcessTypeStageFields.ProcessTypeFieldID
	, ProcessTypeStageFields.ProcessTypeID
	, ISNULL(UserProcessTypeStageLanguage.Name,ISNULL(DefaultProcessTypeStageLanguage.Name,'No name for this stage')) StageName
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ISNULL(UIUpdateTypeNameCustom.Customization,UIUpdateTypeName.Name) UpdateTypeName
	, ProcessTypeStageFields.DateTimeValue
	, ProcessTypeStageFields.IntValue
	, ProcessTypeStageFields.LocationValue
	, ProcessTypeStageFields.StringValue
	, ProcessTypeStageFields.ValueUpdateTypeID
	, ProcessTypeStageFields.ProcessTypeStageFieldStatusID
	, ProcessTypeStageFields.Sequence
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ProcessTypeStageFields.ModifierID
	, ProcessTypeStageFields.ModifiedDate
	, ProcessTypeFields.ProcessTypeFieldTypeID
FROM ProcessTypeStageFields 
JOIN ProcessTypeFields 
	ON ProcessTypeStageFields.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID 
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageLanguage
	ON UserProcessTypeStageLanguage.ProcessTypeStageId = ProcessTypeStageFields.ProcessTypeStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageLanguage
	ON DefaultProcessTypeStageLanguage.ProcessTypeStageId = ProcessTypeStageFields.ProcessTypeStageID
JOIN ProcessTypeStageFieldStatuses 
	ON ProcessTypeStageFieldStatuses.ProcessTypeStageFieldStatusId = ProcessTypeStageFields.ProcessTypeStageFieldStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermId = ProcessTypeStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermId = ProcessTypeStageFieldStatuses.NameTermID
JOIN ValueUpdateTypes
	ON ValueUpdateTypes.ValueUpdateTypeId = ProcessTypeStageFields.ValueUpdateTypeID
JOIN UITermLanguages UIUpdateTypeName
	ON UIUpdateTypeName.UITermId = ValueUpdateTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIUpdateTypeNameCustom
	ON UIUpdateTypeNameCustom.UITermId = ValueUpdateTypes.NameTermID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeStageFields.ModifierID
WHERE ProcessTypeStageFields.ProcessTypeStageFieldId = @ProcessTypeStageFieldID
	AND UIStatusName.LanguageId = @LanguageID
	AND UIUpdateTypeName.LanguageId = @LanguageID



