CREATE PROCEDURE usp_ContentTypeClassificationStatusList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypeClassificationStatuses.ContentTypeClassificationStatusId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ContentTypeClassificationStatuses 
JOIN UITermLanguages UIName
	ON UIName.UITermId = ContentTypeClassificationStatuses.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = ContentTypeClassificationStatuses.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = ContentTypeClassificationStatuses.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = ContentTypeClassificationStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ContentTypeClassificationStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)
