CREATE PROCEDURE [dbo].[usp_RoleGroupLanguages] (@UserID nvarchar(450), @RoleGroupID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT RoleGroupLanguages.RoleGroupLanguageID
	, RoleGroupLanguages.LanguageID
	, RoleGroupLanguages.Name
	, RoleGroupLanguages.Description
	, RoleGroupLanguages.MenuName
	, RoleGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, RoleGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, RoleGroupLanguages.ModifiedDate
FROM RoleGroups
JOIN RoleGroupLanguages
	ON RoleGroups.RoleGroupID = RoleGroupLanguages.RoleGroupID
JOIN Languages 
	ON Languages.LanguageID = RoleGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = RoleGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = RoleGroupLanguages.ModifierID
WHERE RoleGroups.RoleGroupID = @RoleGroupID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
