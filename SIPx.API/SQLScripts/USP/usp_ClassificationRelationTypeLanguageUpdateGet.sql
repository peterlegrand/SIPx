CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeLanguageUpdateGet] (@UserId nvarchar(450), @ClassificationRelationTypeLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ClassificationRelationType' AND Action = 'LanguageUpdate';
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ReadLogClassificationRelationTypeLanguageCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @ClassificationRelationTypeLanguageId, @UserId, Getdate(), @ScreenId)


SELECT ClassificationRelationTypes.ClassificationRelationTypeId 
	, ClassificationRelationTypeLanguages.ClassificationRelationTypeLanguageID
	, ClassificationRelationTypeLanguages.LanguageID
	, ClassificationRelationTypeLanguages.Name
	, ClassificationRelationTypeLanguages.Description
	, ClassificationRelationTypeLanguages.MenuName
	, ClassificationRelationTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationRelationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationRelationTypeLanguages.ModifiedDate
FROM ClassificationRelationTypes
JOIN ClassificationRelationTypeLanguages
	ON ClassificationRelationTypes.ClassificationRelationTypeId = ClassificationRelationTypeLanguages.ClassificationRelationTypeID
JOIN Languages 
	ON Languages.LanguageId = ClassificationRelationTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationRelationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationRelationTypeLanguages.ModifierID
WHERE ClassificationRelationTypeLanguages.ClassificationRelationTypeLanguageId = @ClassificationRelationTypeLanguageID
	AND UILanguageName.LanguageId = @LanguageID
