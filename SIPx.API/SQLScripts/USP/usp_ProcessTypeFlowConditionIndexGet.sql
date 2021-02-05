CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionIndexGet] (@UserId nvarchar(450), @ProcessTypeFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowConditions.ProcessTypeFlowConditionID
	, ISNULL(UserProcessTypeFlowConditionLanguage.Name,ISNULL(DefaultProcessTypeFlowConditionLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeFlowConditionLanguage.Description,ISNULL(DefaultProcessTypeFlowConditionLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeFlowConditionLanguage.MenuName,ISNULL(DefaultProcessTypeFlowConditionLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeFlowConditionLanguage.MouseOver,ISNULL(DefaultProcessTypeFlowConditionLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) ConditionTypeName
	, ProcessTypeFlowConditions.Sequence
	, ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this field')) FieldName
	, ISNULL(UserProcessTypeFieldRoleLanguage.Name,ISNULL(DefaultProcessTypeFieldRoleLanguage.Name,'No name for this field role')) FieldRoleName
	, ProcessTypeFlowConditionComparisonOperators.Symbol
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionString
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionInt
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionDate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeFlowConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, ProcessTypeFlowConditions.ModifiedDate
FROM ProcessTypeFlowConditions 
LEFT JOIN (SELECT ProcessTypeFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowConditionLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFlowConditionLanguage
	ON UserProcessTypeFlowConditionLanguage.ProcessTypeFlowConditionId = ProcessTypeFlowConditions.ProcessTypeFlowConditionID
LEFT JOIN (SELECT ProcessTypeFlowConditionId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowConditionLanguages JOIN Settings ON ProcessTypeFlowConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFlowConditionLanguage
	ON DefaultProcessTypeFlowConditionLanguage.ProcessTypeFlowConditionId = ProcessTypeFlowConditions.ProcessTypeFlowConditionID
JOIN ProcessTypeFlowConditionTypes
	ON ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeId = ProcessTypeFlowConditions.ProcessTypeFlowConditionTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermId = ProcessTypeFlowConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermId = ProcessTypeFlowConditionTypes.NameTermID
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypefieldId = ProcessTypeFlowConditions.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypefieldId = ProcessTypeFlowConditions.ProcessTypeFieldID

LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldRoleLanguage
	ON UserProcessTypeFieldRoleLanguage.ProcessTypefieldId = ProcessTypeFlowConditions.ProcessTypeFieldIDRole
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldRoleLanguage
	ON DefaultProcessTypeFieldRoleLanguage.ProcessTypefieldId = ProcessTypeFlowConditions.ProcessTypeFieldIDRole

LEFT JOIN ProcessTypeFlowConditionComparisonOperators 
	ON ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorId = ProcessTypeFlowConditions.ComparisonOperatorID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlowConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlowConditions.ModifierID
WHERE ProcessTypeFlowConditions.ProcessTypeFlowId = @ProcessTypeFlowID
	AND UITypeName.LanguageId = @LanguageID
ORDER BY ProcessTypeFlowConditions.Sequence


