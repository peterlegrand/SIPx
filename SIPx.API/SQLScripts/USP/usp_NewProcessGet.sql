CREATE PROCEDURE [dbo].[usp_NewProcessGet] ( @ProcessTemplateId int, @UserID nvarchar(450))
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID
	, ProcessTemplateStageFields.Sequence
	, ProcessTemplateStageFields.IntValue
	, ProcessTemplateStageFields.DateTimeValue
	, ProcessTemplateStageFields.StringValue
--	, ProcessTemplateStageFields.LocationValue
	, ProcessTemplateStageFields.ValueUpdateTypeID
	, ProcessTemplateFields.ProcessTemplateFieldID
	, ProcessTemplateFields.ProcessTemplateFieldTypeID
	, ProcessTemplateFields.ProcessTemplateID
	, ProcessTemplateStageFields.ProcessTemplateStageID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this field')) Name
	--, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this field')) Description
	--, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this field')) MenuName
	--, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this field')) MouseOver
FROM ProcessTemplateFlows 
JOIN ProcessTemplateStageFields
	ON ProcessTemplateFlows.ProcessTemplateFromStageId = ProcessTemplateStageFields.ProcessTemplateStageID
		AND ProcessTemplateFlows.ProcessTemplateId = ProcessTemplateStageFields.ProcessTemplateID
JOIN ProcessTemplateFields
	ON ProcessTemplateStageFields.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTemplateFieldID= ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
WHERE ProcessTemplateFlows.ProcessTemplateFromStageId NOT IN (SELECT ProcessTemplateToStageId FROM ProcessTemplateFlows WHERE ProcessTemplateId = @ProcessTemplateID)
	AND ProcessTemplateFlows.ProcessTemplateId = @ProcessTemplateId 
ORDER BY ProcessTemplateStageFields.Sequence

	


