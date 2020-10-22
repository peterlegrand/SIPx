CREATE PROCEDURE usp_ProcessTemplateFlowPassComparisonOperatorList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowPassComparisonOperators.ProcessTemplateFlowPassComparisonOperatorId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTemplateFlowPassComparisonOperators
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateFlowPassComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateFlowPassComparisonOperators.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
