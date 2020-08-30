CREATE PROCEDURE [dbo].[usp_OrganizationTypeLanguageUpdateGet] (@UserId nvarchar(450), @OrganizationTypeLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT OrganizationTypeLanguages.OrganizationTypeLanguageID
	, OrganizationTypeLanguages.LanguageID
	, OrganizationTypeLanguages.Name
	, OrganizationTypeLanguages.Description
	, OrganizationTypeLanguages.MenuName
	, OrganizationTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationTypeLanguages.ModifiedDate
FROM OrganizationTypes
JOIN OrganizationTypeLanguages
	ON OrganizationTypes.OrganizationTypeId = OrganizationTypeLanguages.OrganizationTypeID
JOIN Languages 
	ON Languages.LanguageId = OrganizationTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = OrganizationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTypeLanguages.ModifierID
WHERE OrganizationTypeLanguages.OrganizationTypeLanguageId = @OrganizationTypeLanguageID
	AND UILanguageName.LanguageId = @LanguageID


