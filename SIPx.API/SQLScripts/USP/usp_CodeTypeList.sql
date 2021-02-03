CREATE PROCEDURE usp_CodeTypeList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT CodeTypes.CodeTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM CodeTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = CodeTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = CodeTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID

