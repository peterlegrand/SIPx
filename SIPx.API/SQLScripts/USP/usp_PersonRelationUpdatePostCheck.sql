CREATE PROCEDURE usp_PersonRelationUpdatePostCheck (
	@PersonRelationId int
	, @FromPersonId int
	, @ToPersonId int
	, @PersonRelationTypeId int
	, @UserId nvarchar(450)) 
	AS 

--PETER TODO What is unique about a person?
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM PersonRelations WHERE PersonRelationId = @PersonRelationId) = 0 
BEGIN
insert into @ErrorIdsTable values(79)
END
IF (SELECT COUNT(*) FROM Persons WHERE PersonId = @FromPersonId) = 0 
BEGIN
insert into @ErrorIdsTable values(76)
END
IF (SELECT COUNT(*) FROM Persons WHERE PersonId = @ToPersonId) = 0 
BEGIN
insert into @ErrorIdsTable values(76)
END

IF (SELECT COUNT(*) FROM PersonRelationTypes WHERE PersonRelationTypeId = @PersonRelationTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(78)
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