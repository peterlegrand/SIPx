CREATE PROCEDURE usp_ClassificationLevelPropertyStatusList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevelPropertyStatuses.ClassificationLevelPropertyStatusId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ClassificationLevelPropertyStatuses
JOIN UITermLanguages UIName
	ON UIName.UITermId = ClassificationLevelPropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ClassificationLevelPropertyStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
