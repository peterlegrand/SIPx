CREATE PROCEDURE [dbo].[usp_OrganizationLanguageIndexGet] (@UserId nvarchar(450), @OrganizationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT Organizations.OrganizationId 
	, OrganizationLanguages.OrganizationLanguageID
	, OrganizationLanguages.LanguageID
	, OrganizationLanguages.Name
	, OrganizationLanguages.Description
	, OrganizationLanguages.MenuName
	, OrganizationLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationLanguages.ModifiedDate
FROM Organizations
JOIN OrganizationLanguages
	ON Organizations.OrganizationId = OrganizationLanguages.OrganizationID
JOIN Languages 
	ON Languages.LanguageId = OrganizationLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = OrganizationLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationLanguages.ModifierID
WHERE OrganizationLanguages.OrganizationId = @OrganizationID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)


