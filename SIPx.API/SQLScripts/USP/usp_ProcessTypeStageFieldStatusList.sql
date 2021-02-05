CREATE PROCEDURE [dbo].[usp_ProcessTypeStageFieldStatusList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeStageFieldStatuses.ProcessTypeStageFieldStatusId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTypeStageFieldStatuses
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTypeStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTypeStageFieldStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
