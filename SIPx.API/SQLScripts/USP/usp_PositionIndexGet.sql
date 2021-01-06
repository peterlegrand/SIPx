CREATE PROCEDURE usp_PositionIndexGet (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Positions.PositionID
	, ISNULL(UserPositionLanguage.PositionLanguageID,ISNULL(DefaultPositionLanguage.PositionLanguageID,0)) PositionLanguageID
	, ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this role')) Name
	, ISNULL(UserPositionLanguage.Description,ISNULL(DefaultPositionLanguage.Description,'No description for this role')) Description
	, ISNULL(UserPositionLanguage.MenuName,ISNULL(DefaultPositionLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserPositionLanguage.MouseOver,ISNULL(DefaultPositionLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, @LanguageId LanguageId
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Positions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Positions.ModifiedDate
FROM Positions 
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageID FROM PositionLanguages WHERE LanguageId = @LanguageID) UserPositionLanguage
	ON UserPositionLanguage.PositionId = Positions.PositionID
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageID FROM PositionLanguages JOIN Settings ON PositionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPositionLanguage
	ON DefaultPositionLanguage.PositionId = Positions.PositionID
JOIN Languages 
	ON Languages.LanguageId = @LanguageId
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID

JOIN Persons Creator
	ON Creator.UserId = Positions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Positions.ModifierID
WHERE UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this role'))


