CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionComparisonOperators] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorId 
	, ProcessTemplateFlowConditionComparisonOperators.Symbol
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ProcessTemplateFlowConditionComparisonOperators
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = ProcessTemplateFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = ProcessTemplateFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = ProcessTemplateFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = ProcessTemplateFlowConditionComparisonOperators.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = ProcessTemplateFlowConditionComparisonOperators.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = ProcessTemplateFlowConditionComparisonOperators.MouseOverTermID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
