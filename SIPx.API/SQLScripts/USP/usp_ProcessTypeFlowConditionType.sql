CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionType] (@UserId nvarchar(450) , @ProcessTypeFlowConditionTypeId int)
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ProcessTypeFlowConditionTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTypeFlowConditionTypes.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = ProcessTypeFlowConditionTypes.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = ProcessTypeFlowConditionTypes.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = ProcessTypeFlowConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTypeFlowConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = ProcessTypeFlowConditionTypes.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = ProcessTypeFlowConditionTypes.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = ProcessTypeFlowConditionTypes.MouseOverTermID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
	AND ProcessTypeFlowConditionTypeId = @ProcessTypeFlowConditionTypeID
