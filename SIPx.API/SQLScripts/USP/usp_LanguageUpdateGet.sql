CREATE PROCEDURE [dbo].[usp_LanguageUpdateGet] (@UserId nvarchar(450), @LanguageId int) 
AS 
DECLARE @Language2Id int;
SELECT @Language2Id = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Languages.LanguageID
	, ForeignName
	, ISNULL(UINameCustom.Customization ,UIName.Name) Name
	, Languages.StatusID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Languages.ModifierID
	, Languages.ModifiedDate
FROM Languages 
JOIN UITermLanguages UIName
	ON UIName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @Language2ID) UINameCustom
	ON UINameCustom.UITermId = Languages.NameTermID
JOIN Persons Modifier
	ON Modifier.UserId = Languages.ModifierID
WHERE UIName.LanguageId = @Language2ID
	AND Languages.LanguageID = @LanguageId