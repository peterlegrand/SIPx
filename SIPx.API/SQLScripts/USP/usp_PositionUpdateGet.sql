CREATE PROCEDURE usp_PositionUpdateGet (@UserId nvarchar(450), @PositionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Positions.PositionID
	, ISNULL(UserPositionLanguage.PositionLanguageId,ISNULL(DefaultPositionLanguage.PositionLanguageId,0)) PositionLanguageId
	, ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this role')) Name
	, ISNULL(UserPositionLanguage.Description,ISNULL(DefaultPositionLanguage.Description,'No description for this role')) Description
	, ISNULL(UserPositionLanguage.MenuName,ISNULL(DefaultPositionLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserPositionLanguage.MouseOver,ISNULL(DefaultPositionLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Positions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Positions.ModifiedDate
FROM Positions 
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageId FROM PositionLanguages WHERE LanguageId = @LanguageID) UserPositionLanguage
	ON UserPositionLanguage.PositionId = Positions.PositionID
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageId FROM PositionLanguages JOIN Settings ON PositionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPositionLanguage
	ON DefaultPositionLanguage.PositionId = Positions.PositionID
JOIN Persons Creator
	ON Creator.UserId = Positions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Positions.ModifierID
WHERE Positions.PositionId = @PositionID


