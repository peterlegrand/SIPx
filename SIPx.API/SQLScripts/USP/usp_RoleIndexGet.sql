CREATE PROCEDURE [dbo].[usp_RoleIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT AspNetRoles.ID
	, ISNULL(UserLanguage.RoleLanguageID,ISNULL(DefaultLanguage.RoleLanguageID,0)) RoleLanguageID
	, @LanguageId LanguageId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Role')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Role')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Role')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Role')) MouseOver

	, ISNULL(UserLanguage.CreatorID ,ISNULL(DefaultLanguage.CreatorID,0)) CreatorID
	, ISNULL(UserLanguage.CreatedDate,ISNULL(DefaultLanguage.CreatedDate,getdate())) CreatedDate
	, ISNULL(UserLanguage.CreatorName,ISNULL(DefaultLanguage.CreatorName,'No creator name')) CreatorName
	, ISNULL(UserLanguage.ModifierID,ISNULL(DefaultLanguage.ModifierID,0)) ModifierID
	, ISNULL(UserLanguage.ModifiedDate,ISNULL(DefaultLanguage.ModifiedDate,getdate())) ModifiedDate
	, ISNULL(UserLanguage.ModifierName,ISNULL(DefaultLanguage.ModifierName,'No modifier name')) ModifierName
FROM AspNetRoles 
LEFT JOIN (
	SELECT 
		RoleId
		, Name
		, Description
		, MenuName
		, MouseOver
		, RoleLanguageID
		, RoleLanguages.CreatorID
		, RoleLanguages.ModifierID
		, RoleLanguages.CreatedDate
		, RoleLanguages.ModifiedDate 
		, Creator.FirstName + ' ' + Creator.LastName CreatorName
		, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	FROM RoleLanguages 
	JOIN Persons Creator
		ON Creator.UserId = RoleLanguages.CreatorID
	JOIN Persons Modifier
		ON Modifier.UserId = RoleLanguages.ModifierID
	WHERE LanguageId = @LanguageID
	) UserLanguage
	ON UserLanguage.RoleID= AspNetRoles.ID
LEFT JOIN (
	SELECT 
		RoleId
		, Name
		, Description
		, MenuName
		, MouseOver
		, RoleLanguageID
		, RoleLanguages.CreatorID
		, RoleLanguages.ModifierID
		, RoleLanguages.CreatedDate
		, RoleLanguages.ModifiedDate 
		, Creator.FirstName + ' ' + Creator.LastName CreatorName
		, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	FROM RoleLanguages 
	JOIN Persons Creator
		ON Creator.UserId = RoleLanguages.CreatorID
	JOIN Persons Modifier
	ON Modifier.UserId = RoleLanguages.ModifierID
	JOIN Settings 
		ON RoleLanguages.LanguageId = Settings.IntValue 
	WHERE Settings.SettingId = 1
	) DefaultLanguage
	ON DefaultLanguage.RoleId = AspNetRoles.ID
JOIN Persons Creator
	ON Creator.UserId = UserLanguage.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = UserLanguage.ModifierID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Role')) 


