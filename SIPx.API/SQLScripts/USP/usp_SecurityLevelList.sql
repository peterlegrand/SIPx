CREATE PROCEDURE [dbo].[usp_SecurityLevelList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT SecurityLevels.SecurityLevelId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM SecurityLevels
JOIN UITermLanguages UIName
	ON UIName.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = SecurityLevels.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
