CREATE PROCEDURE [dbo].[usp_RoleGroupLanguageIndexGet] (@UserId nvarchar(450), @RoleGroupId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT RoleGroupLanguages.RoleGroupLanguageID
	, RoleGroupLanguages.RoleGroupID
	, RoleGroupLanguages.LanguageID
	, RoleGroupLanguages.Name
	, RoleGroupLanguages.Description
	, RoleGroupLanguages.MenuName
	, RoleGroupLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, RoleGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, RoleGroupLanguages.ModifiedDate
FROM RoleGroups
JOIN RoleGroupLanguages
	ON RoleGroups.RoleGroupId = RoleGroupLanguages.RoleGroupID
JOIN Languages 
	ON Languages.LanguageId = RoleGroupLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = RoleGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = RoleGroupLanguages.ModifierID
WHERE RoleGroups.RoleGroupId = @RoleGroupID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)
