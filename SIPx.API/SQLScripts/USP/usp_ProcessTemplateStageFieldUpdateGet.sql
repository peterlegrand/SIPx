CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageFieldUpdateGet] (@UserId nvarchar(450), @ProcessTemplateStageFieldId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateStageFields.ProcessTemplateStageFieldID
	, ProcessTemplateStageFields.ProcessTemplateStageID
	, ProcessTemplateStageFields.ProcessTemplateID
	, ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No name for this stage')) StageName
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ISNULL(UIUpdateTypeNameCustom.Customization,UIUpdateTypeName.Name) UpdateTypeName
	, ProcessTemplateStageFields.DateTimeValue
	, ProcessTemplateStageFields.IntValue
	, ProcessTemplateStageFields.LocationValue
	, ProcessTemplateStageFields.StringValue
	, ProcessTemplateStageFields.ValueUpdateTypeID
	, ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID
	, ProcessTemplateStageFields.Sequence
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ProcessTemplateStageFields.ModifierID
	, ProcessTemplateStageFields.ModifiedDate
	, ProcessTemplateFields.ProcessTemplateFieldTypeID
FROM ProcessTemplateStageFields 
JOIN ProcessTemplateFields 
	ON ProcessTemplateStageFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID 
LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageLanguage
	ON UserProcessTemplateStageLanguage.ProcessTemplateStageId = ProcessTemplateStageFields.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageLanguage
	ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageId = ProcessTemplateStageFields.ProcessTemplateStageID
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
WHERE ProcessTemplateStageFields.ProcessTemplateStageFieldId = @ProcessTemplateStageFieldID
	AND UIStatusName.LanguageId = @LanguageID
	AND UIUpdateTypeName.LanguageId = @LanguageID



