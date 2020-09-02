CREATE PROCEDURE usp_UserDeleteGetUser (@UserId nvarchar(450),@SelectedPersonId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


DECLARE @SelectedUserId nvarchar(450);
SELECT @SelectedUserId = UserId FROM Persons WHERE PersonID = @SelectedPersonId;
SELECT @SelectedPersonId PersonId
, UserName
	, Email
 	, ISNULL(CustomSecurityLevel.Customization,DefaultSecurityLevel.Name) SecurityLevelName
FROM AspNetUsers
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelID = AspNetUsers.SecurityLevelID
JOIN UITermLanguages DefaultSecurityLevel
	ON DefaultSecurityLevel.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomSecurityLevel
	ON CustomSecurityLevel.UITermId = SecurityLevels.NameTermID
WHERE @SelectedUserId = Id
	AND DefaultSecurityLevel.LanguageId = @LanguageID