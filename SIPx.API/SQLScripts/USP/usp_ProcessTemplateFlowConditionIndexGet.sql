CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionIndexGet] (@UserId nvarchar(450), @ProcessTemplateFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
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
LEFT JOIN (SELECT ProcessTemplateFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFlowConditionLanguage
	ON UserProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionId = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
LEFT JOIN (SELECT ProcessTemplateFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowConditionLanguages JOIN Settings ON ProcessTemplateFlowConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFlowConditionLanguage
	ON DefaultProcessTemplateFlowConditionLanguage.ProcessTemplateFlowConditionId = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID
JOIN ProcessTemplateFlowConditionTypes
	ON ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeId = ProcessTemplateFlowConditions.ProcessTemplateFlowConditionTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermId = ProcessTemplateFlowConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermId = ProcessTemplateFlowConditionTypes.NameTermID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplatefieldId = ProcessTemplateFlowConditions.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplatefieldId = ProcessTemplateFlowConditions.ProcessTemplateFieldID

LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldRoleLanguage
	ON UserProcessTemplateFieldRoleLanguage.ProcessTemplatefieldId = ProcessTemplateFlowConditions.ProcessTemplateFieldIDRole
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldRoleLanguage
	ON DefaultProcessTemplateFieldRoleLanguage.ProcessTemplatefieldId = ProcessTemplateFlowConditions.ProcessTemplateFieldIDRole

LEFT JOIN ProcessTemplateFlowConditionComparisonOperators 
	ON ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorId = ProcessTemplateFlowConditions.ComparisonOperatorID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFlowConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFlowConditions.ModifierID
WHERE ProcessTemplateFlowConditions.ProcessTemplateFlowId = @ProcessTemplateFlowID
	AND UITypeName.LanguageId = @LanguageID
ORDER BY ProcessTemplateFlowConditions.Sequence


