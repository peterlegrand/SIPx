CREATE PROCEDURE [dbo].[usp_RoleLanguages] (@UserId nvarchar(450), @RoleId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT RoleLanguages.RoleLanguageID
	, RoleLanguages.LanguageID
	, RoleLanguages.Name
	, RoleLanguages.Description
	, RoleLanguages.MenuName
	, RoleLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, RoleLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, RoleLanguages.ModifiedDate
FROM AspNetRoles
JOIN RoleLanguages
	ON AspNetRoles.Id = RoleLanguages.RoleID
JOIN Languages 
	ON Languages.LanguageId = RoleLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = RoleLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = RoleLanguages.ModifierID
WHERE AspNetRoles.Id = @RoleID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
