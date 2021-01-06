CREATE PROCEDURE usp_PropertyStatusList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PropertyStatuses.PropertyStatusId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM PropertyStatuses
JOIN UITermLanguages UIName
	ON UIName.UITermId = PropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PropertyStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
