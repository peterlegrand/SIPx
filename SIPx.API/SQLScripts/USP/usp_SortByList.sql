CREATE PROCEDURE [dbo].[usp_SortByList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT SortBys.SortById 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM SortBys
JOIN UITermLanguages UIName
	ON UIName.UITermId = SortBys.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = SortBys.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
