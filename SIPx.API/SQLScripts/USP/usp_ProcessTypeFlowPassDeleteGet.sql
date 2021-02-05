CREATE PROCEDURE usp_ProcessTypeFlowPassDeleteGet (@UserId nvarchar(450), @ProcessTypeFlowPassId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowPasses.ProcessTypeFlowPassID
	, ProcessTypeFlowPasses.ProcessTypeFlowID
	, ISNULL(UserProcessTypeFlowPassLanguage.Name,ISNULL(DefaultProcessTypeFlowPassLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeFlowPassLanguage.Description,ISNULL(DefaultProcessTypeFlowPassLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeFlowPassLanguage.MenuName,ISNULL(DefaultProcessTypeFlowPassLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeFlowPassLanguage.MouseOver,ISNULL(DefaultProcessTypeFlowPassLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) ProcessTypeFlowPassTypeName
	, ProcessTypeFlowPasses.Sequence
	, ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this field')) ProcessTypeFieldName
	, ISNULL(UserProcessTypeFieldRoleLanguage.Name,ISNULL(DefaultProcessTypeFieldRoleLanguage.Name,'No name for this field role')) ProcessTypeFieldNameRole
	, ProcessTypeFlowPassComparisonOperators.Symbol
	, ProcessTypeFlowPasses.ProcessTypeFlowPassString
	, ProcessTypeFlowPasses.ProcessTypeFlowPassInt
	, ProcessTypeFlowPasses.ProcessTypeFlowPassDate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeFlowPasses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeFlowPasses.ModifiedDate
FROM ProcessTypeFlowPasses 
LEFT JOIN (SELECT ProcessTypeFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowPassLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFlowPassLanguage
	ON UserProcessTypeFlowPassLanguage.ProcessTypeFlowPassId = ProcessTypeFlowPasses.ProcessTypeFlowPassID
LEFT JOIN (SELECT ProcessTypeFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTypeFlowPassLanguages JOIN Settings ON ProcessTypeFlowPassLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFlowPassLanguage
	ON DefaultProcessTypeFlowPassLanguage.ProcessTypeFlowPassId = ProcessTypeFlowPasses.ProcessTypeFlowPassID
JOIN ProcessTypeFlowPassTypes
	ON ProcessTypeFlowPassTypes.ProcessTypeFlowPassTypeId = ProcessTypeFlowPasses.ProcessTypeFlowPassTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermId = ProcessTypeFlowPassTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermId = ProcessTypeFlowPassTypes.NameTermID
LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypefieldId = ProcessTypeFlowPasses.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypefieldId = ProcessTypeFlowPasses.ProcessTypeFieldID

LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldRoleLanguage
	ON UserProcessTypeFieldRoleLanguage.ProcessTypefieldId = ProcessTypeFlowPasses.ProcessTypeFieldIDRole
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldRoleLanguage
	ON DefaultProcessTypeFieldRoleLanguage.ProcessTypefieldId = ProcessTypeFlowPasses.ProcessTypeFieldIDRole

LEFT JOIN ProcessTypeFlowPassComparisonOperators 
	ON ProcessTypeFlowPassComparisonOperators.ProcessTypeFlowPassComparisonOperatorId = ProcessTypeFlowPasses.ComparisonOperatorID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFlowPasses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFlowPasses.ModifierID
WHERE ProcessTypeFlowPasses.ProcessTypeFlowPassId = @ProcessTypeFlowPassId
	AND UITypeName.LanguageId = @LanguageID
ORDER BY ProcessTypeFlowPasses.Sequence


