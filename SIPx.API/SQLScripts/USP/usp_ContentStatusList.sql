CREATE PROCEDURE usp_ContentStatusList (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentStatuses.ContentStatusID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ContentStatuses
JOIN UITermLanguages UIName
	ON UIName.UITermId = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ContentStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)

