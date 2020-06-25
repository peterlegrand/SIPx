CREATE PROCEDURE [dbo].[usp_OrganizationTypeLanguage] (@UserID nvarchar(450), @OrganizationTypeLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT OrganizationTypeLanguages.OrganizationTypeLanguageID
	, OrganizationTypeLanguages.LanguageID
	, OrganizationTypeLanguages.Name
	, OrganizationTypeLanguages.Description
	, OrganizationTypeLanguages.MenuName
	, OrganizationTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationTypeLanguages.ModifiedDate
FROM OrganizationTypes
JOIN OrganizationTypeLanguages
	ON OrganizationTypes.OrganizationTypeID = OrganizationTypeLanguages.OrganizationTypeID
JOIN Languages 
	ON Languages.LanguageID = OrganizationTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = OrganizationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationTypeLanguages.ModifierID
WHERE OrganizationTypeLanguages.OrganizationTypeLanguageID = @OrganizationTypeLanguageID
	AND UILanguageName.LanguageID = @LanguageID


