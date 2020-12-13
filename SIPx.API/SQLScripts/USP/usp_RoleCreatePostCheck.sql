CREATE PROCEDURE usp_RoleCreatePostCheck (
@RoleId nvarchar(450)
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
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
	FROM AspNetRoles 
	WHERE ID = @RoleId) = 0
BEGIN
	insert into @ErrorIdsTable values(29)
END

IF @Name ='' 
BEGIN
insert into @ErrorIdsTable values(104)
END

IF @Description ='' 
BEGIN
insert into @ErrorIdsTable values(9)
END

IF @MenuName ='' 
BEGIN
insert into @ErrorIdsTable values(10)
END

IF @MouseOver ='' 
BEGIN
insert into @ErrorIdsTable values(11)
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