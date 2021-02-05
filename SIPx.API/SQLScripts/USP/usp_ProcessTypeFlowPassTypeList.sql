CREATE PROCEDURE usp_ProcessTypeFlowPassTypeList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFlowPassTypes.ProcessTypeFlowPassTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTypeFlowPassTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTypeFlowPassTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTypeFlowPassTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID and active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
