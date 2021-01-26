CREATE PROCEDURE usp_MetaContentCreatePostCheck (
	@ContentId int
	, @MetaContentTypeId int
	, @MetaTypeId int
	, @MetaRecordId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM MetaContentTypes WHERE MetaContentTypeId = @MetaContentTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(87)
END

--PETER TODO more checking and correct the value code above.
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