CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionComparisonOperatorList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTypeFlowConditionComparisonOperators
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTypeFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTypeFlowConditionComparisonOperators.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
