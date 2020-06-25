CREATE PROCEDURE [dbo].[usp_RoleLanguages] (@UserID nvarchar(450), @RoleID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON AspNetRoles.ID = RoleLanguages.RoleID
JOIN Languages 
	ON Languages.LanguageID = RoleLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = RoleLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = RoleLanguages.ModifierID
WHERE AspNetRoles.ID = @RoleID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
