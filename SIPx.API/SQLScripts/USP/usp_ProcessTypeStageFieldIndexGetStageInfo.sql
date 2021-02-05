CREATE PROCEDURE usp_ProcessTypeStageFieldIndexGetStageInfo (@UserId nvarchar(450), @ProcessTypeStageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeStageFields.ProcessTypeStageFieldID
	, ProcessTypeStageFields.ProcessTypeFieldID
	, ProcessTypeStageFields.ProcessTypeID
	, ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this field')) FieldName
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ISNULL(UIUpdateTypeNameCustom.Customization,UIUpdateTypeName.Name) UpdateTypeName
	, ProcessTypeStageFields.DateTimeValue
	, ProcessTypeStageFields.IntValue
	, ProcessTypeStageFields.LocationValue
	, ProcessTypeStageFields.StringValue
	, ProcessTypeStageFields.ValueUpdateTypeID
	, ProcessTypeStageFields.Sequence
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ProcessTypeStageFields.ModifierID
	, ProcessTypeStageFields.ModifiedDate
FROM ProcessTypeStageFields 
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeStageFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeStageFields.ProcessTypeFieldID
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
WHERE ProcessTypeStageFields.ProcessTypeStageId = @ProcessTypeStageID
	AND UIStatusName.LanguageId = @LanguageID
	AND UIUpdateTypeName.LanguageId = @LanguageID
ORDER BY 	ProcessTypeStageFields.Sequence



