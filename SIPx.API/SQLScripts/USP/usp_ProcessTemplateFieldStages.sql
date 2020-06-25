CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldStages] (@UserID nvarchar(450), @ProcessTemplateFieldID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
	, ProcessTemplateStageFields.Sequence
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStageFields.ModifiedDate
FROM ProcessTemplateStageFields 
LEFT JOIN (SELECT ProcessTemplateStageID, Name FROM ProcessTemplateStageLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateStageLanguage
	ON UserProcessTemplateStageLanguage.ProcessTemplateStageID = ProcessTemplateStageFields.ProcessTemplateStageID
LEFT JOIN (SELECT ProcessTemplateStageID, Name FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateStageLanguage
	ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageID = ProcessTemplateStageFields.ProcessTemplateStageID
JOIN ProcessTemplateStageFieldStatuses 
	ON ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusID = ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermID = ProcessTemplateStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermID = ProcessTemplateStageFieldStatuses.NameTermID
JOIN ValueUpdateTypes
	ON ValueUpdateTypes.ValueUpdateTypeID = ProcessTemplateStageFields.ValueUpdateTypeID
JOIN UITermLanguages UIUpdateTypeName
	ON UIUpdateTypeName.UITermID = ValueUpdateTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIUpdateTypeNameCustom
	ON UIUpdateTypeNameCustom.UITermID = ValueUpdateTypes.NameTermID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStageFields.ModifierID
WHERE ProcessTemplateStageFields.ProcessTemplateFieldID = @ProcessTemplateFieldID
	AND UIStatusName.LanguageID = @LanguageID
	AND UIUpdateTypeName.LanguageID = @LanguageID
ORDER BY 	 ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No name for this stage')) 



