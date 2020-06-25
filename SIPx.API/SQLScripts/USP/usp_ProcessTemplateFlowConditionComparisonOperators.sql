CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionComparisonOperators] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID 
	, ProcessTemplateFlowConditionComparisonOperators.Symbol
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ProcessTemplateFlowConditionComparisonOperators
JOIN UITermLanguages UIName
	ON UIName.UITermID = ProcessTemplateFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = ProcessTemplateFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = ProcessTemplateFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = ProcessTemplateFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = ProcessTemplateFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = ProcessTemplateFlowConditionComparisonOperators.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = ProcessTemplateFlowConditionComparisonOperators.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = ProcessTemplateFlowConditionComparisonOperators.MouseOverTermID
WHERE UIName.LanguageID = @LanguageID
	AND UIDescription.LanguageID = @LanguageID
	AND UIMenuName.LanguageID = @LanguageID
	AND UIMouseOver.LanguageID = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
