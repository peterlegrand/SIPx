CREATE PROCEDURE usp_RoleClaimUpdatePostCheck (
	@RoleId  nvarchar(450)
	, @ClaimId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 

DECLARE @ErrorIdsTable TABLE (id int)

--PETER TODO Need to figure out a lot here.
IF  (SELECT COUNT(*) 
	FROM Claims 
	WHERE ClaimID = @ClaimId) = 0
BEGIN
	insert into @ErrorIdsTable values(119)
END

IF  (SELECT COUNT(*) 
	FROM AspNetRoles 
	WHERE ID = @RoleId) = 0
BEGIN
	insert into @ErrorIdsTable values(29)
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