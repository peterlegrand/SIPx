CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTypeFlowConditionTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTypeFlowConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTypeFlowConditionTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID and active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
