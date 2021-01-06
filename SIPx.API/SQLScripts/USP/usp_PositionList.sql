CREATE PROCEDURE usp_PositionList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Positions.PositionID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) Name
FROM Positions 
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver FROM PositionLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PositionID= Positions.PositionID
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver FROM PositionLanguages JOIN Settings ON PositionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PositionId = Positions.PositionID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Classification relation type')) 
