CREATE PROCEDURE usp_OrganizationPositionUpdatePostCheck (
 	@OrganizationPersonId int
	, @PersonId int
	, @PositionId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Persons WHERE PersonId = @PersonId) = 0 
BEGIN
insert into @ErrorIdsTable values(76)
END


IF (SELECT COUNT(*) FROM Positions WHERE PositionId = @PositionId) = 0 
BEGIN
insert into @ErrorIdsTable values(123)
END

-- PETER TODO to check if the combi already exists in a different record
SELECT ErrorMessages.ErrorMessageID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM @ErrorIdsTable Errors 
JOIN ErrorMessages 
	ON Errors.id = ErrorMessages.ErrorMessageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ErrorMessages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageID

END