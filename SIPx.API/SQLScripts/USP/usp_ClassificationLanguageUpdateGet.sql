CREATE PROCEDURE [dbo].[usp_ClassificationLanguageUpdateGet] (@UserId nvarchar(450), @ClassificationLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'Classification' AND Action = 'LanguageUpdate';
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ReadLogClassificationLanguageCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @ClassificationLanguageId, @UserId, Getdate(), @ScreenId)

SELECT ClassificationLanguages.ClassificationLanguageID
	, ClassificationLanguages.ClassificationID
	, ClassificationLanguages.LanguageID
	, UILanguageName.Name LanguageName
	, ClassificationLanguages.Name
	, ClassificationLanguages.Description
	, ClassificationLanguages.MenuName
	, ClassificationLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationLanguages.ModifiedDate
FROM Classifications
JOIN ClassificationLanguages
	ON Classifications.ClassificationId = ClassificationLanguages.ClassificationID
JOIN Languages 
	ON Languages.LanguageId = ClassificationLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationLanguages.ModifierID
WHERE ClassificationLanguages.ClassificationLanguageId = @ClassificationLanguageID
	AND UILanguageName.LanguageId = @LanguageID

COMMIT TRANSACTION