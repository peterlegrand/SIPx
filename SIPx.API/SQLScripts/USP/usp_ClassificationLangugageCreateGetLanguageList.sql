CREATE PROCEDURE [dbo].[usp_ClassificationLangugageCreateGetLanguageList] (@UserID nvarchar(450),
	@ClassificationId int
) 
AS 
BEGIN 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Languages.LanguageID 
	, ISNULL(UINameCustom.Customization ,UIName.Name) Name
FROM Languages
JOIN UITermLanguages UIName
	ON UIName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = Languages.NameTermID
WHERE Languages.LanguageID NOT IN (Select LanguageId FROM ClassificationLanguages WHERE ClassificationID = @ClassificationId)
AND Languages.StatusID = 1
	AND UIName.LanguageID = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization ,UIName.Name)
END
