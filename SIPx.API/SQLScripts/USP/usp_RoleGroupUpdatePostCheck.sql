CREATE PROCEDURE usp_RoleGroupUpdatePostCheck (
	@RoleGroupId int
	, @Sequence int
	, @Name nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT MAX(Sequence) 
	FROM RoleGroups ) < @Sequence + 1
BEGIN
	insert into @ErrorIdsTable values(3)
END

IF (SELECT COUNT(*) FROM RoleGroups WHERE RoleGroupID = @RoleGroupId) =0
BEGIN
insert into @ErrorIdsTable values(98)
END

IF @Sequence < 1
BEGIN
	insert into @ErrorIdsTable values(4)

END

IF  (SELECT COUNT(*) 
	FROM RoleGroupLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND RoleGroupId <> @RoleGroupId ) > 0
BEGIN
	insert into @ErrorIdsTable values(97)
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