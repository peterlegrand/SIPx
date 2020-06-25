CREATE PROCEDURE [dbo].[usp_OrganizationLanguage] (@UserID nvarchar(450), @OrganizationLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Organizations.OrganizationID 
	, OrganizationLanguages.OrganizationLanguageID
	, OrganizationLanguages.LanguageID
	, OrganizationLanguages.Name
	, OrganizationLanguages.Description
	, OrganizationLanguages.MenuName
	, OrganizationLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationLanguages.ModifiedDate
FROM Organizations
JOIN OrganizationLanguages
	ON Organizations.OrganizationID = OrganizationLanguages.OrganizationID
JOIN Languages 
	ON Languages.LanguageID = OrganizationLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = OrganizationLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationLanguages.ModifierID
WHERE OrganizationLanguages.OrganizationLanguageID = @OrganizationLanguageID
	AND UILanguageName.LanguageID = @LanguageID


