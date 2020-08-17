CREATE PROCEDURE [dbo].[usp_PersonRelationTypeDeleteGet] (@UserId nvarchar(450), @PersonRelationTypeID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PersonRelationTypes.PersonRelationTypeID
	, ISNULL(UserLanguage.PersonRelationTypeLanguageID,ISNULL(DefaultLanguage.PersonRelationTypeLanguageID,0)) PersonRelationTypeLanguageID
	, @LanguageId LanguageId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this person relation type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this person relation type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this person relation type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this person relation type')) MouseOver
	, ISNULL(UserLanguage.FromIsAnXOfTo,ISNULL(DefaultLanguage.FromIsAnXOfTo,'No mouse over for this FromIsAnXOfTo')) MouseOver
	, ISNULL(UserLanguage.ToIsAnXOfFrom,ISNULL(DefaultLanguage.ToIsAnXOfFrom,'No mouse over for this ToIsAnXOfFrom')) MouseOver
	, SeePersonal
	, Color
	, ISNULL(UINameCustom.Customization,UIName.Name) IconName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, PersonRelationTypes.CreatorID
	, PersonRelationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, PersonRelationTypes.ModifierID
	, PersonRelationTypes.ModifiedDate
FROM PersonRelationTypes 
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver,FromIsAnXOfTo, ToIsAnXOfFrom, PersonRelationTypeLanguageID FROM PersonRelationTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PersonRelationTypeID= PersonRelationTypes.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, Description, MenuName, MouseOver,FromIsAnXOfTo, ToIsAnXOfFrom, PersonRelationTypeLanguageID FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PersonRelationTypeId = PersonRelationTypes.PersonRelationTypeID
JOIN Persons Creator
	ON Creator.UserId = PersonRelationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelationTypes.ModifierID
JOIN Icons
	ON Icons.IconId = PersonRelationTypes.IconID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Icons.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Icons.NameTermID
WHERE UIName.LanguageId = @LanguageID 
	AND PersonRelationTypes.PersonRelationTypeID = @PersonRelationTypeID


