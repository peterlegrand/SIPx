CREATE PROCEDURE [dbo].[usp_OrganizationTypeDeleteGet] (@UserId nvarchar(450), @OrganizationTypeID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationTypes.OrganizationTypeID
	, OrganizationTypes.CodePrefix
	, OrganizationTypes.CodeSuffix
	, OrganizationTypes.CodeTypeId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this organization type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this organization type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this organization type')) MouseOver
	, ISNULL(CustomObjectTypeStatus.Customization,DefaultObjectTypeStatus.Name) ObjectTypeStatusName
	, OrganizationTypes.Internal
	, OrganizationTypes.LegalEntity
	, Color
	, ISNULL(UINameCustom.Customization,UIName.Name) IconName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationTypes.ModifiedDate
FROM OrganizationTypes 
LEFT JOIN (SELECT OrganizationTypeId, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationTypeID= OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationTypeId = OrganizationTypes.OrganizationTypeID
JOIN ObjectTypeStatuses
	ON ObjectTypeStatuses.ObjectTypeStatusID = OrganizationTypes.ObjectTypeStatusID
JOIN UITermLanguages DefaultObjectTypeStatus
	ON DefaultObjectTypeStatus.UITermId = ObjectTypeStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomObjectTypeStatus
	ON CustomObjectTypeStatus.UITermId = ObjectTypeStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = OrganizationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTypes.ModifierID
JOIN Icons
	ON Icons.IconId = OrganizationTypes.IconID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Icons.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Icons.NameTermID
WHERE UIName.LanguageId = @LanguageID 
	AND OrganizationTypes.OrganizationTypeID = @OrganizationTypeID
	AND DefaultObjectTypeStatus.LanguageId = @LanguageID