CREATE PROCEDURE usp_ProcessTemplateStageFieldIndexGetStageInfo (@UserId nvarchar(450), @ProcessTemplateStageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateStageFields.ProcessTemplateStageFieldID
	, ProcessTemplateStageFields.ProcessTemplateFieldID
	, ProcessTemplateStageFields.ProcessTemplateID
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this field')) FieldName
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ISNULL(UIUpdateTypeNameCustom.Customization,UIUpdateTypeName.Name) UpdateTypeName
	, ProcessTemplateStageFields.DateTimeValue
	, ProcessTemplateStageFields.IntValue
	, ProcessTemplateStageFields.LocationValue
	, ProcessTemplateStageFields.StringValue
	, ProcessTemplateStageFields.ValueUpdateTypeID
	, ProcessTemplateStageFields.Sequence
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ProcessTemplateStageFields.ModifierID
	, ProcessTemplateStageFields.ModifiedDate
FROM ProcessTemplateStageFields 
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateStageFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateStageFields.ProcessTemplateFieldID
JOIN ProcessTemplateStageFieldStatuses 
	ON ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusId = ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
JOIN ValueUpdateTypes
	ON ValueUpdateTypes.ValueUpdateTypeId = ProcessTemplateStageFields.ValueUpdateTypeID
JOIN UITermLanguages UIUpdateTypeName
	ON UIUpdateTypeName.UITermId = ValueUpdateTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIUpdateTypeNameCustom
	ON UIUpdateTypeNameCustom.UITermId = ValueUpdateTypes.NameTermID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateStageFields.ModifierID
WHERE ProcessTemplateStageFields.ProcessTemplateStageId = @ProcessTemplateStageID
	AND UIStatusName.LanguageId = @LanguageID
	AND UIUpdateTypeName.LanguageId = @LanguageID
ORDER BY 	ProcessTemplateStageFields.Sequence



