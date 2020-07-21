CREATE PROCEDURE [dbo].[usp_GenderList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Genders.GenderId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	
FROM Genders 
JOIN UITermLanguages UIName
	ON UIName.UITermId = Genders.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Genders.NameTermID
WHERE UIName.LanguageId = @LanguageID
	AND Genders.Active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)



