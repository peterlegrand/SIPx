CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationRelationTypes.ClassificationRelationTypeID
	, ISNULL(UserClassificationRelationTypeLanguage.ClassificationRelationTypeLanguageID,ISNULL(DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeLanguageID,0)) ClassificationRelationTypeLanguageID
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationRelationTypeLanguage.Description,ISNULL(DefaultClassificationRelationTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationRelationTypeLanguage.MenuName,ISNULL(DefaultClassificationRelationTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationRelationTypeLanguage.MouseOver,ISNULL(DefaultClassificationRelationTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, @LanguageId LanguageId
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationRelationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationRelationTypes.ModifiedDate
FROM ClassificationRelationTypes 
LEFT JOIN (SELECT ClassificationRelationTypeId, Name, Description, MenuName, MouseOver, ClassificationRelationTypeLanguageID FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationRelationTypes.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name, Description, MenuName, MouseOver, ClassificationRelationTypeLanguageID FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationRelationTypes.ClassificationRelationTypeID
JOIN Languages 
	ON Languages.LanguageId = @LanguageId
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID

JOIN Persons Creator
	ON Creator.UserId = ClassificationRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationRelationTypes.ModifierID
WHERE UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this role'))


