CREATE PROCEDURE [dbo].[usp_RoleGroupLanguage] (@UserId nvarchar(450), @RoleGroupLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
WHERE RoleGroupLanguages.RoleGroupLanguageId = @RoleGroupLanguageID
	AND UILanguageName.LanguageId = @LanguageID
