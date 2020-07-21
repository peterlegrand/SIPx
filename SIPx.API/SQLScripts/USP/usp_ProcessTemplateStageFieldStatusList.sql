CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageFieldStatusList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTemplateStageFieldStatuses
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
