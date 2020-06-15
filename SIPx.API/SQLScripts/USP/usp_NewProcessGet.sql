CREATE PROCEDURE [dbo].[usp_NewProcessGet] ( @ProcessTemplateID int) --@UserID nvarchar(450),
AS 
--DECLARE @LanguageID int;
--SELECT @LanguageID = IntPreference
--FROM UserPreferences
--WHERE USerId = @UserID
--	AND UserPreferences.PreferenceTypeID = 1 ;

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
	--, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this field')) Name
	--, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this field')) Description
	--, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this field')) MenuName
	--, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this field')) MouseOver
FROM ProcessTemplateFlows 
JOIN ProcessTemplateStageFields
	ON ProcessTemplateFlows.ProcessTemplateFromStageID = ProcessTemplateStageFields.ProcessTemplateStageID
		AND ProcessTemplateFlows.ProcessTemplateID = ProcessTemplateStageFields.ProcessTemplateID
JOIN ProcessTemplateFields
	ON ProcessTemplateStageFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
--LEFT JOIN (SELECT ProcessTemplateFieldID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages WHERE LanguageID = @LanguageID) UserLanguage
--	ON UserLanguage.ProcessTemplateFieldID= ProcessTemplateFields.ProcessTemplateFieldID
--LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
--	ON DefaultLanguage.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
WHERE ProcessTemplateFlows.ProcessTemplateFromStageID NOT IN (SELECT ProcessTemplateToStageID FROM ProcessTemplateFlows WHERE ProcessTemplateID = @ProcessTemplateID)
	AND ProcessTemplateFlows.ProcessTemplateID = @ProcessTemplateID 
ORDER BY ProcessTemplateStageFields.Sequence

	


