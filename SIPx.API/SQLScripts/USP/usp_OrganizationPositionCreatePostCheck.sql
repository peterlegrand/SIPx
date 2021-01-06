CREATE PROCEDURE usp_OrganizationPositionCreatePostCheck (
 	@OrganizationId int
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

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationId = @OrganizationId) = 0 
BEGIN
insert into @ErrorIdsTable values(48)
END

IF (SELECT COUNT(*) FROM Persons WHERE PersonId = @PersonId) = 0 
BEGIN
insert into @ErrorIdsTable values(76)
END


IF (SELECT COUNT(*) FROM Positions WHERE PositionId = @PositionId) = 0 
BEGIN
insert into @ErrorIdsTable values(123)
END

IF (SELECT COUNT(*) FROM OrganizationPersons WHERE PersonId = @PersonId AND PositionId = @PositionId AND  OrganizationId = @OrganizationId) <> 0 
BEGIN
insert into @ErrorIdsTable values(124)
END

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