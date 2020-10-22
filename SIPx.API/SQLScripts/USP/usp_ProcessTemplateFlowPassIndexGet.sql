CREATE PROCEDURE usp_ProcessTemplateFlowPassIndexGet (@UserId nvarchar(450), @ProcessTemplateFlowId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
	, ISNULL(UserProcessTemplateFlowPassLanguage.Name,ISNULL(DefaultProcessTemplateFlowPassLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFlowPassLanguage.Description,ISNULL(DefaultProcessTemplateFlowPassLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFlowPassLanguage.MenuName,ISNULL(DefaultProcessTemplateFlowPassLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFlowPassLanguage.MouseOver,ISNULL(DefaultProcessTemplateFlowPassLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) PassTypeName
	, ProcessTemplateFlowPasses.Sequence
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this field')) FieldName
	, ISNULL(UserProcessTemplateFieldRoleLanguage.Name,ISNULL(DefaultProcessTemplateFieldRoleLanguage.Name,'No name for this field role')) FieldRoleName
	, ProcessTemplateFlowPassComparisonOperators.Symbol
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassstring
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassInt
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassDate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplateFlowPasses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, ProcessTemplateFlowPasses.ModifiedDate
FROM ProcessTemplateFlowPasses 
LEFT JOIN (SELECT ProcessTemplateFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowPassLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFlowPassLanguage
	ON UserProcessTemplateFlowPassLanguage.ProcessTemplateFlowPassId = ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
LEFT JOIN (SELECT ProcessTemplateFlowPassId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFlowPassLanguages JOIN Settings ON ProcessTemplateFlowPassLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFlowPassLanguage
	ON DefaultProcessTemplateFlowPassLanguage.ProcessTemplateFlowPassId = ProcessTemplateFlowPasses.ProcessTemplateFlowPassID
JOIN ProcessTemplateFlowPassTypes
	ON ProcessTemplateFlowPassTypes.ProcessTemplateFlowPassTypeId = ProcessTemplateFlowPasses.ProcessTemplateFlowPassTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermId = ProcessTemplateFlowPassTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermId = ProcessTemplateFlowPassTypes.NameTermID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplatefieldId = ProcessTemplateFlowPasses.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplatefieldId = ProcessTemplateFlowPasses.ProcessTemplateFieldID

LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldRoleLanguage
	ON UserProcessTemplateFieldRoleLanguage.ProcessTemplatefieldId = ProcessTemplateFlowPasses.ProcessTemplateFieldIDRole
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldRoleLanguage
	ON DefaultProcessTemplateFieldRoleLanguage.ProcessTemplatefieldId = ProcessTemplateFlowPasses.ProcessTemplateFieldIDRole

LEFT JOIN ProcessTemplateFlowPassComparisonOperators 
	ON ProcessTemplateFlowPassComparisonOperators.ProcessTemplateFlowPassComparisonOperatorId = ProcessTemplateFlowPasses.ComparisonOperatorID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFlowPasses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFlowPasses.ModifierID
WHERE ProcessTemplateFlowPasses.ProcessTemplateFlowId = @ProcessTemplateFlowID
	AND UITypeName.LanguageId = @LanguageID
ORDER BY ProcessTemplateFlowPasses.Sequence


