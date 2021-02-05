CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionComparisonOperator] (@UserId nvarchar(450), @ProcessTypeFlowConditionComparisonOperatorId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorId 
	, ProcessTypeFlowConditionComparisonOperators.Symbol
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ProcessTypeFlowConditionComparisonOperators
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTypeFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = ProcessTypeFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = ProcessTypeFlowConditionComparisonOperators.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = ProcessTypeFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTypeFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = ProcessTypeFlowConditionComparisonOperators.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = ProcessTypeFlowConditionComparisonOperators.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = ProcessTypeFlowConditionComparisonOperators.MouseOverTermID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
	AND ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorId = @ProcessTypeFlowConditionComparisonOperatorID

