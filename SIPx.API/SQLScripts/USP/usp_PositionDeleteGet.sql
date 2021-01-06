CREATE PROCEDURE usp_PositionDeleteGet (@UserId nvarchar(450),@PositionId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Positions.PositionID
	, ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this classification level')) Name
	, ISNULL(UserPositionLanguage.Description,ISNULL(DefaultPositionLanguage.Description,'No description for this classification level')) Description
	, ISNULL(UserPositionLanguage.MenuName,ISNULL(DefaultPositionLanguage.MenuName,'No menu name for this classification level')) MenuName
	, ISNULL(UserPositionLanguage.MouseOver,ISNULL(DefaultPositionLanguage.MouseOver,'No drop Mouse over for this classification level')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Positions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Positions.ModifiedDate
FROM Positions
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver FROM PositionLanguages WHERE LanguageId = @LanguageID) UserPositionLanguage
	ON UserPositionLanguage.PositionId = Positions.PositionID
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver FROM PositionLanguages JOIN Settings ON PositionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPositionLanguage
	ON DefaultPositionLanguage.PositionId = Positions.PositionID
JOIN Persons Creator
	ON Creator.UserId = Positions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Positions.ModifierID
WHERE Positions.PositionId = @PositionID
