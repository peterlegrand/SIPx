CREATE PROCEDURE usp_ProcessTypeFlowPassComparisonOperatorList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowPassComparisonOperators.ProcessTypeFlowPassComparisonOperatorId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTypeFlowPassComparisonOperators
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTypeFlowPassComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTypeFlowPassComparisonOperators.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
