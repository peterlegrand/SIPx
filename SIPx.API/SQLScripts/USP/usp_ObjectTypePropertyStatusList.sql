CREATE PROCEDURE usp_ObjectTypePropertyStatusList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ObjectTypePropertyStatuses.ObjectTypePropertyStatusID
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName

FROM ObjectTypePropertyStatuses 
JOIN UITermLanguages UIName
	ON UIName.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ObjectTypePropertyStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID