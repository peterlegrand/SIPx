CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageFieldStatuses] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ProcessTemplateStageFieldStatuses
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateStageFieldStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = ProcessTemplateStageFieldStatuses.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = ProcessTemplateStageFieldStatuses.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = ProcessTemplateStageFieldStatuses.MouseOverTermID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
