CREATE PROCEDURE usp_ProjectTypeMatrixCreatePostCheck (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromProjectTypeId int
	, @ToProjectTypeId int
	, @ProjectMatrixTypeId int
	, @IsFrom bit
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ProjectTypes WHERE ProjectTypeId = @FromProjectTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(200)
END

IF (SELECT COUNT(*) FROM ProjectTypes WHERE ProjectTypeId = @ToProjectTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(201)
END


IF (SELECT COUNT(*) FROM ProjectMatrixTypes WHERE ProjectMatrixTypeId = @ProjectMatrixTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(202)
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