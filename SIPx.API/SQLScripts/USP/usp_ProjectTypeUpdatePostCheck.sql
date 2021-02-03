CREATE PROCEDURE usp_ContentTypeUpdatePostCheck (
	@ContentTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @HasAnyChildContentType bit
	, @HasAnyMatrixContentType bit
	, @Color char(9) 
	, @IconId int 
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ContentTypes WHERE ContentTypeId = @ContentTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(96)
END
IF (SELECT COUNT(*) FROM Icons WHERE IconId = @IconId) = 0 
BEGIN
insert into @ErrorIdsTable values(43)
END


IF  (SELECT COUNT(*) 
	FROM ContentTypeLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name AND ContentTypeId <> @ContentTypeId) > 0
BEGIN
	insert into @ErrorIdsTable values(95)
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