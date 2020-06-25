CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowCondition] (@UserID nvarchar(450), @ProcessTemplateFlowConditionID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
	, ISNULL(UserProcessTemplateFlowConditionLanguage.Name,ISNULL(DefaultProcessTemplateFlowConditionLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFlowConditionLanguage.Description,ISNULL(DefaultProcessTemplateFlowConditionLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFlowConditionLanguage.MenuName,ISNULL(DefaultProcessTemplateFlowConditionLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFlowConditionLanguage.MouseOver,ISNULL(DefaultProcessTemplateFlowConditionLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) ConditionTypeName
	, ProcessTemplateFlowConditions.Sequence
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this field')) FieldName
	, ISNULL(UserProcessTemplateFieldRoleLanguage.Name,ISNULL(DefaultProcessTemplateFieldRoleLanguage.Name,'No name for this field role')) FieldRoleName
	, ProcessTemplateFlowConditionComparisonOperators.Symbol
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionString
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionInt
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionDate
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFlowConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFlowConditions.ModifiedDate
FROM ProcessTemplateFlowConditions 
LEFT JOIN (SELECT ProcessTemplateFlowConditionID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateFlowConditionLanguage
	ON UserProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionID = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
LEFT JOIN (SELECT ProcessTemplateFlowConditionID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages JOIN Settings ON ProcessTemplateFlowConditionLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateFlowConditionLanguage
	ON DefaultProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionID = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
JOIN ProcessTemplateFlowConditionTypes
	ON ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermID = ProcessTemplateFlowConditionTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermID = ProcessTemplateFlowConditionTypes.NameTermID
LEFT JOIN (SELECT ProcessTemplateFieldID, Name FROM ProcessTemplateFieldLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplatefieldID = ProcessTemplateFlowConditions.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplatefieldID = ProcessTemplateFlowConditions.ProcessTemplateFieldID

LEFT JOIN (SELECT ProcessTemplateFieldID, Name FROM ProcessTemplateFieldLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateFieldRoleLanguage
	ON UserProcessTemplateFieldRoleLanguage.ProcessTemplatefieldID = ProcessTemplateFlowConditions.ProcessTemplateFieldIDRole
LEFT JOIN (SELECT ProcessTemplateFieldID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateFieldRoleLanguage
	ON DefaultProcessTemplateFieldRoleLanguage.ProcessTemplatefieldID = ProcessTemplateFlowConditions.ProcessTemplateFieldIDRole

LEFT JOIN ProcessTemplateFlowConditionComparisonOperators 
	ON ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID = ProcessTemplateFlowConditions.ComparisonOperatorID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFlowConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFlowConditions.ModifierID
WHERE ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID = @ProcessTemplateFlowConditionID
	AND UITypeName.LanguageID = @LanguageID


